0LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity ShiftLeft2 is
port
(
	Entrada: in std_logic_vector(31 downto 0);
	Salida: out std_logic_vector(31 downto 0)
);
end entity;

architecture ShiftLeft2 of ShiftLeft2 is
	signal ResultadoSHL: std_logic_vector(31 downto 0);

begin
	Salida <= Entrada(29 downto 0)&"00";
	
end architecture;