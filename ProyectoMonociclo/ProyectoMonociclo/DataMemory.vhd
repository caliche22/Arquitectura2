LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DataMemory is
port
(
	Clock: in std_logic;
	MemWrite: in std_logic;
	MemRead: in std_logic;
	WriteData: in std_logic_vector(24 downto 0);
	Address: in std_logic_vector(24 downto 0);
	ReadData: out std_logic_vector(24 downto 0)
);
end entity;

architecture DataMemory of DataMemory is
	type RAM is array(0 to 60) of std_logic_vector(24 downto 0);
	signal MemoriaRam : RAM :=
	(
		0 => "0000000000000000000000000",
		1 => "0000000000000000000000000",
		others => "0000000000000000000000000"
	);

	begin

		ReadData <= MemoriaRam(to_integer(unsigned(Address)));
		process(Clock, MemWrite)
			begin
				if (rising_edge(Clock)) then
					if(MemWrite = '1') then
						MemoriaRam(to_integer(unsigned(Address))) <= WriteData;
					end if;
				end if;
		end process;
end architecture;