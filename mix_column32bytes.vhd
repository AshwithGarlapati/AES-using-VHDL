----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:56:11 07/18/2021 
-- Design Name: 
-- Module Name:    mix_column32bytes - Behavioral 
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

entity mix_column32bytes is
    Port ( data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end mix_column32bytes;

architecture Behavioral of mix_column32bytes is

-- signal declaration of required temporary variables for storing and divisiona nd shifting of data.
signal temp1, temp2, temp3, temp4, s_temp1, s_temp2, s_temp3, s_temp4, temp1_xp8, temp2_xp8, temp3_xp8, temp4_xp8 : std_logic_vector(7 downto 0);

begin
	
	-- Division of row data of 32 bits into bytes
	temp1 <= data_in(31 downto 24);
	temp2 <= data_in(23 downto 16);
	temp3 <= data_in(15 downto 8);
	temp4 <= data_in(7 downto 0);
	
	-- checking MSB for x^8
	check_MSB : process(temp1, temp2, temp3, temp4)
	begin
		
		if(temp1(7) = '1') then
			temp1_xp8 <= "00011011";
		else
			temp1_xp8 <= "00000000";
		end if;
		
		if(temp2(7) = '1') then
			temp2_xp8 <= "00011011";
		else
			temp2_xp8 <= "00000000";
		end if;
		
		if(temp3(7) = '1') then
			temp3_xp8 <= "00011011";
		else
			temp3_xp8 <= "00000000";
		end if;
		
		if(temp4(7) = '1') then
			temp4_xp8 <= "00011011";
		else
			temp4_xp8 <= "00000000";
		end if;		
	end process check_MSB;
		
		
	-- shifting of data
--	s_temp1 <= temp1 sll 1;
--	s_temp2 <= temp2 sll 1;
--	s_temp3 <= temp3 sll 1;
--	s_temp4 <= temp4 sll 1;

	s_temp1 <= temp1(6 downto 0) & '0';
	s_temp2 <= temp2(6 downto 0) & '0';
	s_temp3 <= temp3(6 downto 0) & '0';
	s_temp4 <= temp4(6 downto 0) & '0';
	
	-- Assingning multiplited data to output variable
	-- Here the in the case of matrix multiplication the left shift the data w.r.t the matrix
	-- And the addition is the XOR operation of the two 8-bit binary numbers
	
	data_out(31 downto 24) <= s_temp1 xor temp1_xp8 xor s_temp2 xor temp2_xp8 xor temp2 xor temp3 xor temp4;
	data_out(23 downto 16) <= temp1 xor s_temp2 xor temp2_xp8 xor s_temp3 xor temp3_xp8 xor temp3 xor temp4;
	data_out(15 downto 8) <= temp1 xor temp2 xor s_temp3 xor temp3_xp8 xor s_temp4 xor temp4_xp8 xor temp4;
	data_out(7 downto 0) <= s_temp1 xor temp1_xp8 xor temp1 xor temp2 xor temp3 xor s_temp4 xor temp4_xp8;
	

end Behavioral;

