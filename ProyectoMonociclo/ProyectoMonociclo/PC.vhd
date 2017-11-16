LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity PC is
port
(
	Clock: in std_logic;
	ResetPC: in std_logic;
	Enable: in std_logic;
	--EnableModo: in std_logic;
	PCin: in std_logic_vector(24 downto 0);
	PCout: out std_logic_vector(24 downto 0)
);
end entity;

architecture PC of PC is
	signal PCtemp: std_logic_vector(24 downto 0);
begin
	process(Clock, ResetPC) begin
		if (ResetPC = '1') then
			if(Enable = '1')then  --or EnableModo = '1') then
				if(rising_edge(Clock)) then
					PCout <= PCtemp;
				elsif falling_edge(Clock) then
					PCtemp <= PCin;	
				end if;
			end if;
		else
			PCOut <= "0000000000000000000000000";
		end if;
	end process;
	
end architecture;
