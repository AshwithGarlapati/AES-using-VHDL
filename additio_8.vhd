----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:26:00 07/18/2021 
-- Design Name: 
-- Module Name:    additio_8 - Behavioral 
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

-- Design for addition of two 8-bit binary numbers w.r.t Galios field.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity additio_8 is
    Port ( input_data1 : in  STD_LOGIC_VECTOR (7 downto 0);
			  input_data2 : in  STD_LOGIC_VECTOR (7 downto 0);
           output_data : out  STD_LOGIC_VECTOR (7 downto 0));
end additio_8;

architecture Behavioral of additio_8 is

begin

   -- Addition with respect to Galios field is the XOR operation of two input numbers.
	output_data <= input_data1 xor input_data2;
	
end Behavioral;

