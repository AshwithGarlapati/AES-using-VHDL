----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:35:48 07/21/2021 
-- Design Name: 
-- Module Name:    round_1to9 - Behavioral 
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

-- This VHDL module of code is for rounds 1 to 9 of AES algorithm.

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

entity round_1to9 is
    Port ( text_in : in  STD_LOGIC_VECTOR (127 downto 0);
           key_in : in  STD_LOGIC_VECTOR (127 downto 0);
           round_number : in  STD_LOGIC_VECTOR (3 downto 0);
			  key_out : out STD_LOGIC_VECTOR (127 downto 0);
           text_out : out  STD_LOGIC_VECTOR (127 downto 0));
end round_1to9;




architecture Behavioral of round_1to9 is


-- Component declaration for key expansion
component key_expansion is
    Port ( key_in : in  STD_LOGIC_VECTOR (127 downto 0);
           round_number : in  STD_LOGIC_VECTOR (3 downto 0);
           key_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

-- Component declaration for 4 steps in a round
-- 1. Substitution of bytes
component sub_bytes is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

-- 2. Shifting of Rows
component Shift_row is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

-- 3. Mix-Columns
component mix_column is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

-- 4. Addition of Round key
component add_round_key is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;


-- Intermediate signal declaration
signal s1, s2, s3, key : std_logic_vector(127 downto 0);


begin
	
	-- Key expansion
	key_exp : key_expansion port map(key_in, round_number, key);
	
	-- Instatind 4 steps in a round
 	step1 : sub_bytes port map(text_in, s1);
	step2 : shift_row port map(s1, s2);
	step3 : mix_column port map(s2, s3);
	step4 : add_round_key port map(s3, key, text_out); 
	
	key_out <= key;
	
end Behavioral;

