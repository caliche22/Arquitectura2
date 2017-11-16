LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;


entity RegisterFile is
port
(
	Clock: in std_logic;
	RegWrite: in std_logic;
	WriteRegister: in std_logic_vector(4 downto 0);
	ReadRegister1: in std_logic_vector(4 downto 0);
	ReadRegister2: in std_logic_vector(4 downto 0);
	WriteData: in std_logic_vector(24 downto 0);
	ReadData1: out std_logic_vector(24 downto 0);
	ReadData2: out std_logic_vector(24 downto 0)
);
end entity;

architecture RegisterFile of  RegisterFile is
	type REG_FILE is array (0 to 24) of std_logic_vector(24 downto 0);
	signal Reg : REG_FILE :=
	(
		others => "0000000000000000000000000"
	);
	
begin
	ReadData1 <= Reg(conv_integer(ReadRegister1));
	ReadData2 <= Reg(conv_integer(ReadRegister2));
	process(Clock, RegWrite)
		begin
			if rising_edge(Clock) then
				if RegWrite = '1' then
					Reg(conv_integer(WriteRegister)) <= WriteData;
				end if;
			end if;
	end process;
end architecture;