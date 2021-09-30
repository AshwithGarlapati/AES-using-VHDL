----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:23:00 07/17/2021 
-- Design Name: 
-- Module Name:    sub_bytes - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sub_bytes is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end sub_bytes;

architecture Behavioral of sub_bytes is

-- Signal declaration for division of data and substitution of bytes
signal d0, d1, d2, d3, d4, d5, d6, d7,d8, d9, d10, d11, d12, d13, d14, d15 : std_logic_vector(7 downto 0);

-- signal delclaration for concatenation of bytes
signal c0, c1,c2, c3, c4, c5, c6, c7, c8, c9 ,c10, c11, c12, c13, c14, c15: std_logic_vector(7 downto 0);

-- Component declaration of S-Box
component s_box is
    Port ( data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

begin

	d0 <= data_in(127 downto 120);
	d1 <= data_in(119 downto 112);
	d2 <= data_in(111 downto 104);
	d3 <= data_in(103 downto 96);
	
	d4 <= data_in(95 downto 88);
	d5 <= data_in(87 downto 80);
	d6 <= data_in(79 downto 72);
	d7 <= data_in(71 downto 64);
	
	d8 <= data_in(63 downto 56);
	d9 <= data_in(55 downto 48);
	d10 <= data_in(47 downto 40);
	d11 <= data_in(39 downto 32);
	
	d12 <= data_in(31 downto 24);
	d13 <= data_in(23 downto 16);
	d14 <= data_in(15 downto 8);
	d15 <= data_in(7 downto 0);
	
	-- Instantiation for substitution of bytes using S-Box
	w0: s_box port map(d0, c0);
	w1: s_box port map(d1, c1);
	w2: s_box port map(d2, c2);
	w3: s_box port map(d3, c3);
	w4: s_box port map(d4, c4);
	w5: s_box port map(d5, c5);
	w6: s_box port map(d6, c6);
	w7: s_box port map(d7, c7);
	w8: s_box port map(d8, c8);
	w9: s_box port map(d9, c9);
	w10: s_box port map(d10, c10);
	w11: s_box port map(d11, c11);
	w12: s_box port map(d12, c12);
	w13: s_box port map(d13, c13);
	w14: s_box port map(d14, c14);
	w15: s_box port map(d15, c15);
	
	data_out <= c0&c1&c2&c3&c4&c5&c6&c7&c8&c9&c10&c11&c12&c13&c14&c15;

	
end Behavioral;

