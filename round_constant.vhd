----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:40:35 07/20/2021 
-- Design Name: 
-- Module Name:    round_constant - Behavioral 
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

entity round_constant is
    Port ( round_in : in  STD_LOGIC_VECTOR (3 downto 0);
           round_out : out  STD_LOGIC_VECTOR (31 downto 0));
end round_constant;

architecture Behavioral of round_constant is

begin
	
	round_constant : process(round_in)
	begin
	
	case round_in is 
	when x"1" => round_out <= x"01000000";
	when x"2" => round_out <= x"02000000";
	when x"3" => round_out <= x"04000000";
	when x"4" => round_out <= x"08000000";
	when x"5" => round_out <= x"10000000";
	when x"6" => round_out <= x"20000000";
	when x"7" => round_out <= x"40000000";
	when x"8" => round_out <= x"80000000";
	when x"9" => round_out <= x"1b000000";
	when x"a" => round_out <= x"36000000";
	when others => round_out <= x"00000000";
	end case;
	
	end process round_constant;

end Behavioral;

