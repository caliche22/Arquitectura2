LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity CuatroBits is
generic
(
	Valor: integer := 1
);

port
(
	Salida: out std_logic_vector(24 downto 0)
);
end entity;

architecture CuatroBits of CuatroBits is
	signal Resultado: std_logic_vector(24 downto 0);
begin
	Salida <= conv_std_logic_vector(Valor,25);
end architecture;
