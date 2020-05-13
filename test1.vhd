-- Vhdl test bench created from schematic C:\Users\matpa\Desktop\poziom\acc\accschem.sch - Wed Apr 01 17:58:57 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY accschem_accschem_sch_tb IS
END accschem_accschem_sch_tb;
ARCHITECTURE behavioral OF accschem_accschem_sch_tb IS 

   COMPONENT accschem
   PORT( CLK	:	IN	STD_LOGIC; 
          RST	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL CLK	:	STD_LOGIC;
   SIGNAL RST	:	STD_LOGIC;

BEGIN

   UUT: accschem PORT MAP(
		CLK => CLK, 
		RST => RST
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
