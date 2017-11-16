LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity ANDBranch is
port
(
	Branch: in std_logic;
	Zero: in std_logic;
	Salida: out std_logic
);
end entity;

architecture ANDBranch of ANDBranch is
	signal ResultAND: std_logic;
	
begin
	Salida <= Branch and Zero;
end architecture;