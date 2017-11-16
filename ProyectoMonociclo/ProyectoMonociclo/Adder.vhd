LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Adder is
port
(
	Valor1IN: in std_logic_vector(24 downto 0);
	Valor2IN: in std_logic_vector(24 downto 0);
	ValorSalida: out std_logic_vector(24 downto 0)
);
end entity;

architecture Adder of Adder is
	signal ResultadoAdder: std_logic_vector(24 downto 0);

begin
	ValorSalida <= Valor1IN + Valor2IN;
	
end architecture;
