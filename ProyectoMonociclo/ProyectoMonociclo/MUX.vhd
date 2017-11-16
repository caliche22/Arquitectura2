LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity MUX is
port
(
	Sel: in std_logic;
	Entrada0: in std_logic_vector(24 downto 0);
	Entrada1: in std_logic_vector(24 downto 0);
	Salida: out std_logic_vector(24 downto 0)
);
end entity;

architecture MUX of MUX is

begin
	with Sel select
		Salida <= Entrada0 when '0',
		Entrada1 when others;
end architecture;