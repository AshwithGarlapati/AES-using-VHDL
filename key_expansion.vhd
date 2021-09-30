----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:54:36 07/20/2021 
-- Design Name: 
-- Module Name:    key_expansion - Behavioral 
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

entity key_expansion is
    Port ( key_in : in  STD_LOGIC_VECTOR (127 downto 0);
           round_number : in  STD_LOGIC_VECTOR (3 downto 0);
           key_out : out  STD_LOGIC_VECTOR (127 downto 0));
end key_expansion;


architecture Behavioral of key_expansion is

-- Component declaration of Round constant
component round_constant is
    Port ( round_in : in  STD_LOGIC_VECTOR (3 downto 0);
           round_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

-- Component declaration for G function
component g_function is
    Port ( data_in : in  STD_LOGIC_VECTOR (31 downto 0);
			  round_const : in STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

-- Temporary signal assignment for assignment of data
signal w1, w2, w3, w4 : std_logic_vector(31 downto 0);
signal r_con : std_logic_vector(31 downto 0);
signal g_out, o1, o2, o3, o4 : std_logic_vector(31 downto 0);

begin
	
	-- Dividing data into blocks
	w1 <= key_in(127 downto 96);
	w2 <= key_in(95 downto 64);
	w3 <= key_in(63 downto 32);
	w4 <= key_in(31 downto 0);
	
	-- Round constant generation
	r_constant : round_constant port map (round_number, r_con);
	
	-- Key expansion
	g_fun : g_function port map (w4, r_con, g_out);
	o1 <= w1 xor g_out;
	o2 <= w2 xor o1;
	o3 <= w3 xor o2;
	o4 <= w4 xor o3;
	
	-- Concatinating key
	key_out <= o1&o2&o3&o4;

end Behavioral;

