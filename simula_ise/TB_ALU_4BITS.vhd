----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:39:13 06/16/2022 
-- Design Name: 
-- Module Name:    TB_ALU_4BITS - Behavioral 
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

entity TB_ALU_4BITS is
end TB_ALU_4BITS;

architecture Behavioral of TB_ALU_4BITS is
component ALU_4BITS is
	port (  A,B    : in  STD_LOGIC_VECTOR(3 downto 0);
           opcode : in  STD_LOGIC_VECTOR(2 downto 0);
           Cout   : out  STD_LOGIC;
           Yout   : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

signal A      : std_logic_vector(3 downto 0):= "1011";
signal B      : std_logic_vector(3 downto 0):= "1001";
signal opcode : std_logic_vector(2 downto 0):= (others => '0');
signal Cout   : std_logic := '0';
signal Result : std_logic_vector(3 downto 0):= (others => '0');

begin
	UUT : ALU_4BITS port map(A,B,opcode,Cout,Result);
	A <= "1100" after 80 ns;
	B <= "1010" after 80 ns;
	opcode <= opcode + '1' after 10 ns;
end Behavioral;

