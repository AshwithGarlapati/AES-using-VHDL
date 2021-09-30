----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:23:33 07/20/2021 
-- Design Name: 
-- Module Name:    g_function - Behavioral 
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

entity g_function is
    Port ( data_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  round_const : in STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end g_function;

architecture Behavioral of g_function is

-- component declaration of S Box
component s_box is
    Port ( data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

-- signal declaration for seperation
signal t1 : std_logic_vector(7 downto 0);
signal t2 : std_logic_vector(23 downto 0);
signal t3, t4 : std_logic_vector(31 downto 0);

begin
	
	-- The ROTword operation of G function
	t1 <= data_in(31 downto 24);
	t2 <= data_in(23 downto 0);
	t3 <= t2&t1;
	
	-- Substitution of bytes using S-box operation
	s1 : s_box port map (t3(31 downto 24), t4(31 downto 24));
	s2 : s_box port map (t3(23 downto 16), t4(23 downto 16));
	s3 : s_box port map (t3(15 downto 8), t4(15 downto 8));
	s4 : s_box port map (t3(7 downto 0), t4(7 downto 0));
	
	-- Adding Round Constant
	data_out <= t4 xor round_const;

end Behavioral;

