LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity SignExtend is
port
(
	Constante: in std_logic_vector(7 downto 0);
	ConstanteOut: out std_logic_vector(24 downto 0)
);
end entity;

architecture SignExtend of SignExtend is
	signal ResultadoSE: std_logic_vector(24 downto 0);
	
begin
	ConstanteOut(7 downto 0) <= Constante;
	ext:
	for i in 8 to 24 generate
		ConstanteOut(i) <= Constante(7);
	end generate;
end architecture;
