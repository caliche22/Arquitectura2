ibrary ieee;
use ieee.std_logic_1164.all;

entity dualedge is

	port(
		clk		 : in	std_logic;
		x	 	 : in	std_logic;
		output	 : out	std_logic
	);

end entity;

architecture behabiur of dualedge is

	--los estados son estos dibujos de jason
	type state_type is (s0, s1, s2, s3);

	signal estado   : state_type;

begin

	process (clk,x)
	begin
	if rising_edge(clk) then
		case estado is
			when s0=>
				if x = '1' then
					estado <= s1;
				else
					estado <= s0;
				end if;
			when s1=>
				if x = '1' then
					estado <= s2;
				else
					estado <= s1;
				end if;
			when s2=>
				if x = '0' then
					estado <= s3;
				else
					estado<= s2;
				end if;
			when s3 =>
				if x = '0' then
					estado <= s0;
				else
					estado <= s3;
				end if;
		end case;
	end if;
	end process;

	process (estado)
	begin
		case estado is
			when s0 =>
				output <= '0';
			when s1 =>
				output <= '1';
			when s2 =>
				output <= '0';
			when s3 =>
				output <= '1';
		end case;
	end process;

end behabiur