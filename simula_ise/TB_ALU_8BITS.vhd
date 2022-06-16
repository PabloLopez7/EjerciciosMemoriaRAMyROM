----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:01:41 06/16/2022 
-- Design Name: 
-- Module Name:    TB_ALU_8BITS - tb 
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

entity TB_ALU_8BITS is
end TB_ALU_8BITS;

architecture tb of TB_ALU_8BITS is
component ALU_8BITS is
	Port (  a_i      : in  STD_LOGIC_VECTOR(7 downto 0);
           b_i      : in  STD_LOGIC_VECTOR(7 downto 0);
           opcode_i : in  STD_LOGIC_VECTOR(1 downto 0);
           d_o      : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

signal a_s      : std_logic_vector(7 downto 0);
signal b_s      : std_logic_vector(7 downto 0);
signal opcode_s : std_logic_vector(1 downto 0);
signal d_s      : std_logic_vector(7 downto 0);

begin
	UUT : ALU_8BITS port map(a_s, b_s, opcode_s, d_s);
	a_s <= "00010001", "01100101" after 5 ns;
	b_s <= "00100011", "00000010" after 5 ns, "00111001" after 20 ns;
	opcode_s <= "00", "01" after 5 ns;

end tb;

