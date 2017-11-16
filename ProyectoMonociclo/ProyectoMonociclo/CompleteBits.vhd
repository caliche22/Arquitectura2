library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity CompleteBits is
port
(
	Valor1: in std_logic_vector(7 downto 0);
	SalidaData: out std_logic_vector(24 downto 0)
);
end entity;

architecture CompleteBits of CompleteBits is

begin
	SalidaData <= "00000000000000000"&Valor1;
end architecture;