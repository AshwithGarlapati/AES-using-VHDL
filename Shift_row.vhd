----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:04:02 07/17/2021 
-- Design Name: 
-- Module Name:    Shift_row - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Shift_row is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end Shift_row;

architecture Behavioral of Shift_row is

-- Signal declaration
signal c0, c1,c2, c3, c4, c5, c6, c7, c8, c9 ,c10, c11, c12, c13, c14, c15: std_logic_vector(7 downto 0);

begin

	c0 <= data_in(127 downto 120);
	c1 <= data_in(95 downto 88);
	c2 <= data_in(63 downto 56);
	c3 <= data_in(31 downto 24);
	
	c4 <= data_in(119 downto 112);
	c5 <= data_in(87 downto 80);
	c6 <= data_in(55 downto 48);
	c7 <= data_in(23 downto 16);
	
	c8 <= data_in(111 downto 104);
	c9 <= data_in(79 downto 72);
	c10 <= data_in(47 downto 40);
	c11 <= data_in(15 downto 8);
	
	c12 <= data_in(103 downto 96);
	c13 <= data_in(71 downto 64);
	c14 <= data_in(39 downto 32);
	c15 <= data_in(7 downto 0);
	
	data_out <= c0&c5&c10&c15&c1&c6&c11&c12&c2&c7&c8&c13&c3&c4&c9&c14; 
	
end Behavioral;

