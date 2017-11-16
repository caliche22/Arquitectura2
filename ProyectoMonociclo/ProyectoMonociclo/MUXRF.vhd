LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity MUXRF is
port
(
	RegDst: in std_logic;
	RD: in std_logic_vector(4 downto 0);
	RT: in std_logic_vector(4 downto 0);
	WriteRegister: out std_logic_vector(4 downto 0)
);
end entity;

architecture MUXRF of MUXRF is

begin
	with RegDst select
		WriteRegister <= RT when '0',
		RD when others;
end architecture;