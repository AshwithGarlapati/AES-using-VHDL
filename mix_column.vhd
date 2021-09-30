----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:54:20 07/18/2021 
-- Design Name: 
-- Module Name:    mix_column - Behavioral 
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

-- Design for mix column using multiplication of matrix

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

entity mix_column is
    Port ( data_in : in  STD_LOGIC_VECTOR (127 downto 0);
           data_out : out  STD_LOGIC_VECTOR (127 downto 0));
end mix_column;

architecture Behavioral of mix_column is

-- Signal declaration 
signal i1, i2, i3, i4 , o1, o2, o3, o4 : std_logic_vector(31 downto 0);

-- Component declaration of mix columnof 32 bytes
component mix_column32bytes is
Port ( data_in : in  STD_LOGIC_VECTOR (31 downto 0);
       data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

begin
	
	-- Input data divion into 32 bytes
	i1 <= data_in(127 downto 96);
	i2 <= data_in(95 downto 64);
	i3 <= data_in(63 downto 32);
	i4 <= data_in(31 downto 0);
	
	-- instantiation for mix_column32
	r1 : mix_column32bytes port map (i1, o1);
	r2 : mix_column32bytes port map (i2, o2);
	r3 : mix_column32bytes port map (i3, o3);
	r4 : mix_column32bytes port map (i4, o4);
	
	-- Concatination of outputs
	data_out <= o1&o2&o3&o4;
	
end Behavioral;

