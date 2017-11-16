LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU is
port
(
	Valor1: in std_logic_vector(24 downto 0);
	Valor2: in std_logic_vector(24 downto 0);
	ALUop: in std_logic_vector(1 downto 0);
	Zero: out std_logic;
	Resultado: out std_logic_vector(24 downto 0)
);
end ALU;

architecture ALU of ALU is

begin

process (ALUop, Valor1, Valor2)
	begin
		if Aluop = "00" then --ADD --LW --SW
			Resultado <= std_logic_vector(signed(Valor1)+signed(Valor2));
			Zero <= '0';
		elsif Aluop = "01" then --BEQ
			if (std_logic_vector(unsigned(Valor1)) = std_logic_vector(unsigned(Valor2))) then
				Zero <= '1';
			else
				Zero <= '0';
			end if;
		elsif Aluop = "10" then --BNE
			if (std_logic_vector(unsigned(Valor1)) = std_logic_vector(unsigned(Valor2))) then
				Zero <= '0';
			else
				Zero <= '1';
			end if;
		else 
			Resultado <= "0000000000000000000000000";
		end if;
			
end process;

end ALU;