-- Code to be included in VHDL test bench: provides responses on SDA
-- and SCL lines coming from I2C slave device. Events & received bytes
-- are reported as sim console messages, in read transactions
-- consecutive byte vlaues (X00, X01...) are transmitted.
-- NOT synthesizable, for simulation only.
-- J.S.


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_textio.all;

LIBRARY std;
use std.textio.all;

(...)

   --------------------------------------------------------------------
   --------------------------------------------------------------------
	-- I2C bus behaviour
   SDA <= 'H';
   SCL <= 'H';
   process
      variable bAddr  : std_logic_vector( 7 downto 0 );             -- I2C adress received as the first byte
      variable bWrite : std_logic_vector( 7 downto 0 );             -- byte received in write transfers
      variable bRead  : std_logic_vector( 7 downto 0 ) := X"00";    -- byte transmitted in read transfers
      variable Ack : std_logic;
      variable L: line;	-- simulation messages (textio)
   begin
      SDA <= 'Z';
      loop
         -- wait for start condition
         wait until falling_edge( SDA ) and SCL /= '0';
         -- Report
         write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] START condition" );
         writeline( output, L );

         -- 8 bits of address
         for i in 0 to 8 loop
            wait until falling_edge( SCL );
            bAddr := bAddr( 6 downto 0 ) & SDA;
         end loop;
         -- Report
         write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] address byte: " ); hwrite( L, bAddr );
         writeline( output, L );
         
         -- pull down ACK for address byte
         wait for 2.5 us / 4;
         SDA <= '0';
         wait for 2.5 us;
         SDA <= 'Z';
         
         if bAddr( 0 ) = '0' then

            -- Master is writing
            loop
               -- Be prepared for Stop condition
               wait until rising_edge( SCL ); 
               wait until rising_edge( SDA ) or falling_edge( SCL );
               if rising_edge( SDA ) then
                  write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] STOP condition" );
                  writeline( output, L );
                  exit;
               end if;
               
               -- Another byte write, first bit (MSB)
               bWrite( 0 ) := SDA;
               
               -- another 7 bits of the write
               for i in 1 to 7 loop
                  wait until falling_edge( SCL );
                  bWrite := bWrite( 6 downto 0 ) & SDA;
               end loop;
               
               -- Report
               write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] byte received: " ); hwrite( L, bWrite );
               writeline( output, L );

               -- pull down for ACK the write
               wait for 2.5 us / 4;
               SDA <= '0';
               wait for 2.5 us;
               SDA <= 'Z';
             end loop;

         else

            -- Master is reading
            loop
               for i in 7 downto 0 loop
                  if bRead( i ) = '1' then
                     SDA <= 'Z';
                  else
                     SDA <= '0';
                  end if;
                  wait until falling_edge( SCL );
                  wait for 2.5 us / 4;
               end loop;
               SDA <= 'Z';
               
               -- Read ACK
               wait until rising_edge( SCL );
               wait for 2.5 us / 4;
               Ack := SDA;
               wait for 2.5 us / 2;
               
               -- Report
               write( L, "[I2C " ); write( L, now, UNIT => us ); write( L, "] byte transmitted: " ); hwrite( L, bRead );
               if Ack = '0' then
                  write( L, " with positive ACK" );
               else
                  write( L, ", NACK in response" );
               end if;
               writeline( output, L );

               exit when Ack /= '0';

               -- Increment byte to be transmitted in the next read slot
               bRead := std_logic_vector( unsigned( bRead ) + 1 );
            end loop;

         end if;
         
      end loop;
   end process;
   --------------------------------------------------------------------
   --------------------------------------------------------------------
