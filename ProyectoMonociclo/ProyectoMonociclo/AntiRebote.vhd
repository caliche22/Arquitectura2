Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AntiRebote is
port
(
	Clock: in std_logic;
	Reset: in std_logic;
	Button: in std_logic;
	Salida: out std_logic
);
end entity;

architecture AntiRebote of AntiRebote is
 
signal Shift_Reg: std_logic_vector(2 downto 0);

begin
	process(Clock, Reset)
		begin
			if (Reset = '1') then
				Shift_Reg <= "000";
			elsif(rising_edge(Clock)) then
				Shift_Reg <= (NOT(Button))&Shift_Reg(2 downto 1);
			end if;
	end process;
	
Salida <= Shift_Reg(2) and Shift_Reg(1) and Shift_Reg(0);

end architecture;