library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Complete30Bits is
port
(
	Valor1MUX: in std_logic_vector(1 downto 0);
	SalidaWriteData: out std_logic_vector(24 downto 0)
);
end entity;

architecture Complete30Bits of Complete30Bits is

begin

	SalidaWriteData <= "000000000000000000000000000000"&Valor1MUX;

end architecture;