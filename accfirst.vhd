----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:33:46 03/27/2020 
-- Design Name: 
-- Module Name:    accfirst - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;
-- This is a sample state-machine using enumerated types.
-- This will allow the synthesis tool to select the appropriate
-- encoding style and will make the code more readable.
 
entity accfirst is
Port(
Address: out std_logic_vector(7 downto 0 );
FIFO_Empty:in std_logic ;
FIFO_Full:in std_logic ;
Go:out std_logic ;
ReadCnt:out std_logic_vector(3 downto 0);
FIFO_DO:in std_logic_vector(7 downto 0); 
FIFO_DI:out std_logic_vector(7 downto 0); 
FIFO_Push_signal: out std_logic ;
Busy: in std_logic ;
FIFO_Pop: out std_logic ;
RST: in std_logic ;
CLK:in std_logic );
end accfirst;

architecture Behavioral of accfirst is



--Insert the following in the architecture before the begin keyword
   --Use descriptive names for the states, like st1_reset, st2_search
   type state_type is (DO_NOTHING ,WRITE_ADDRESS, GO_STATE_2, BUSY_STATE, BUSY_STATE_2, READ_DATA, RESET);
   signal state, next_state : state_type; 
	signal licznik: unsigned(2 downto 0) := ( others => '0' );
 --Declare internal signals for all outputs of the state-machine
   --signal <output>_i : std_logic;  -- example output signal
   --other outputs
begin
--Insert the following in the architecture after the begin keyword
   SYNC_PROC: process (CLK)
   begin
      if rising_edge(CLK) then  
         if ( RST = '1') then
            state <= DO_NOTHING;
            --SDA <= '0';
         else
            state <= next_state;
            --<output> <= <output>_i;
         -- assign other outputs to internal signals
         end if;        
      end if;
   end process;
 

 
   NEXT_STATE_DECODE: process (state,BUSY, RST, FIFO_FULL)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when Do_NOTHING =>
            if Busy = '0' then
						next_state <= WRITE_ADDRESS;
            end if;
         when WRITE_ADDRESS =>
            next_state <= BUSY_STATE; 
			when BUSY_STATE => 
				if BUSY = '0' then
					next_state <= GO_STATE_2;
				end if;
			when GO_STATE_2  =>
				if BUSY = '0' then
					next_state <= BUSY_STATE_2;
				end if;				 
			when BUSY_STATE_2 => 
				if BUSY = '0' then
					next_state <= READ_DATA;
				end if;
			when READ_DATA =>
				if  state = READ_DATA   then
					next_state <= RESET; 
				end if;
			when RESET =>
				if  RST = '1'   then
					next_state <= Do_NOTHING;
				elsif RST = '0' then 
					next_state <= RESET;
				end if;
			when others =>
            next_state <= DO_NOTHING;
      end case;      
   end process;

FIFO_PUSH_signal <= '1' when ( (state = WRITE_ADDRESS  or state = GO_STATE_2) and FIFO_Full ='0') else '0'; 
Go <= '1' when ( (state = WRITE_ADDRESS ) or  (state = GO_STATE_2 ) )else '0' ; 
FIFO_DI <= X"01" when ( state = WRITE_ADDRESS or state = GO_STATE_2  )  and  FIFO_Full ='0'  else X"00";
Address <= X"3A" when ( state = WRITE_ADDRESS ) else
			  X"3B" when ( state = GO_STATE_2  ) else
			  X"00" ;
ReadCnt <= "0001" when  ( ( state = GO_STATE_2 ) )  else "0000";
FIFO_Pop <= '1' when ( state = READ_DATA ) else '0';


end Behavioral;

