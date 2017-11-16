LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity MUXInput is
port
(
	Sel: in std_logic_vector(1 downto 0);
	Entrada0: in std_logic_vector(24 downto 0);
	Entrada1: in std_logic_vector(24 downto 0);
	Entrada2: in std_logic_vector(24 downto 0);
	Salida: out std_logic_vector(24 downto 0)
);
end entity;

architecture MUXInput of MUXInput is

begin
	with Sel select
		Salida <= Entrada0 when "00",
				    Entrada1 when "01",
		Entrada2 when others;
end architecture;