----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

--opcode    operacion
--000       Transformacion de A
--001       Transformacion de B
--010       A and B
--011       A or B
--100       A + B
--101       A + 1
--110       A - 1
--111       A - B

entity ALU_4BITS is
    Port ( A,B : in  STD_LOGIC_VECTOR (3 downto 0);
           opcode : in  STD_LOGIC_VECTOR (2 downto 0);
           Cout : out  STD_LOGIC;
           Yout : out  STD_LOGIC_VECTOR (3 downto 0));
end ALU_4BITS;

architecture Behavioral of ALU_4BITS is
 signal Y_tmp: std_logic_vector(4 downto 0) := (others => '0'); 
begin
	--Para que aparezca el acarreo se debe concatenar un cero a la izquierda
	--Operaciones Lógicas
	with opcode(2 downto 0) select
		Y_tmp <= ('0' & A) when "000",
					('0' & B) when "001",
					('0' & A) and ('0' & B) when "010",
					('0' & A) or  ('0' & B) when "011",
	--Operaciones Aritmenticas
					('0' & A) + B   when "100",
					('0' & A) + '1' when "101",
					('0' & A) - '1' when "110",
					('0' & A) - B   when others;
					
Cout <= Y_tmp(4);
Yout  <= Y_tmp(3 downto 0);

end Behavioral;

