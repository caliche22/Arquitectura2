LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Jump is
port
(
	JumpIn: in std_logic_vector(7 downto 0);
	JumpOut: out std_logic_vector(24 downto 0)
);
end entity;

architecture Jump of Jump is
	signal ResultadoJump: std_logic_vector(24 downto 0);
begin
	JumpOut <= "00000000000000000"&JumpIn;
end architecture;
	
	