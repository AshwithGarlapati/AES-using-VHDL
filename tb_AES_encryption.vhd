--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:19:37 07/27/2021
-- Design Name:   
-- Module Name:   D:/HDL/AES_encryption/tb_AES_encryption.vhd
-- Project Name:  AES_encryption
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: AES_encryption
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_AES_encryption IS
END tb_AES_encryption;
 
ARCHITECTURE behavior OF tb_AES_encryption IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT AES_encryption
    PORT(
         plain_text : IN  std_logic_vector(127 downto 0);
         key : IN  std_logic_vector(127 downto 0);
         cipher_text : OUT  std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal plain_text : std_logic_vector(127 downto 0) := (others => '0');
   signal key : std_logic_vector(127 downto 0) := (others => '0');

 	--Outputs
   signal cipher_text : std_logic_vector(127 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: AES_encryption PORT MAP (
          plain_text => plain_text,
          key => key,
          cipher_text => cipher_text
        );

   -- Inputs of Chpher text
	inputs : process
	begin
		
		--plain_text <= x"324356a8885a308d313198a2e0370734";
		--key <= x"2b7e151628aed2a6abf7158809cf4f3c";
		
		plain_text <= x"54776f204f6e65204e696e652054776f";
		key <= x"5468617473206d79204b756e67204675";
		
		--wait for clock_period;
		wait for 100 ns;
		
		wait;
	end process inputs;
	
END;
