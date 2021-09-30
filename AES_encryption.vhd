----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:43:36 07/17/2021 
-- Design Name: 
-- Module Name:    AES_encryption - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AES_encryption is
    Port ( plain_text : in  STD_LOGIC_VECTOR (127 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           cipher_text : out  STD_LOGIC_VECTOR (127 downto 0));
end AES_encryption;

architecture Behavioral of AES_encryption is


-- Component declaration for rounds 1 to 9 and fo rround 10.
component round_1to9 is
    Port ( text_in : in  STD_LOGIC_VECTOR (127 downto 0);
           key_in : in  STD_LOGIC_VECTOR (127 downto 0);
           round_number : in  STD_LOGIC_VECTOR (3 downto 0);
			  key_out : out STD_LOGIC_VECTOR(127 downto 0);
           text_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

-- Component declaration for round 10
component round_10 is
    Port ( text_in : in  STD_LOGIC_VECTOR (127 downto 0);
           key_in : in  STD_LOGIC_VECTOR (127 downto 0);
           round_number : in  STD_LOGIC_VECTOR (3 downto 0);
           text_out : out STD_LOGIC_VECTOR (127 downto 0));
end component;

-- Component dclaration for addition of roung key
component add_round_key is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           key : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end component;

-- Signal declaration for intermediate signals between rounds
-- for text
signal text1, text2, text3, text4, text5, text6, text7, text8, text9, text10 : std_logic_vector(127 downto 0);
-- for keys
signal key1, key2, key3, key4, key5, key6, key7, key8, key9 : std_logic_vector(127 downto 0);
-- for round numbers
signal rn1, rn2, rn3, rn4, rn5, rn6, rn7, rn8, rn9, rn10 : std_logic_vector(3 downto 0);

begin
	
	-- assigning round numbers
	rn1 <= x"1";
	rn2 <= x"2";
	rn3 <= x"3";
	rn4 <= x"4";
	rn5 <= x"5";
	rn6 <= x"6";
	rn7 <= x"7";
	rn8 <= x"8";
	rn9 <= x"9";
	rn10 <= x"a";
	
	-- Pre-round  : Addition of the key
	pre_round : add_round_key port map (plain_text, key, text1);
	
	-- Rounds 1 to 9
	r1 : round_1to9 port map (text1, key, rn1, key1, text2);
	r2 : round_1to9 port map (text2, key1, rn2, key2, text3);
	r3 : round_1to9 port map (text3, key2, rn3, key3, text4);
	r4 : round_1to9 port map (text4, key3, rn4, key4, text5);
	r5 : round_1to9 port map (text5, key4, rn5, key5, text6);
	r6 : round_1to9 port map (text6, key5, rn6, key6, text7);
	r7 : round_1to9 port map (text7, key6, rn7, key7, text8);
	r8 : round_1to9 port map (text8, key7, rn8, key8, text9);
	r9 : round_1to9 port map (text9, key8, rn9, key9, text10);
	
	-- Round 10
	r10 : round_10 port map (text10, key9, rn10, cipher_text);
	
end Behavioral;

