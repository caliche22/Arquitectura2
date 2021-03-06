LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity DivisorFrecuencia is
port
(
	Clock: in std_logic;
	Reset: in std_logic;
	ClockOut: out std_logic
);
end entity;

architecture DivisorFrecuencia of DivisorFrecuencia is
	signal Temporal: std_logic;
	signal Contador: integer range 0 to 24999999 := 0;
begin
	process(Clock, Reset)
		begin
			if (Reset = '1') then
				Temporal <= '0';
				Contador <= 0;
			elsif rising_edge(Clock) then
				if(Contador = 4166665) then
					Temporal <= NOT(Temporal);
					Contador <= 0;
				else
					Contador <= Contador+1;
				end if;
			end if;
	end process;
	
	ClockOut <= Temporal;

end architecture;
