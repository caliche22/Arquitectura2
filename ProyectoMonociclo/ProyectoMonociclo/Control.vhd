library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Control is
port
(
	Opcode: in std_logic_vector(4 downto 0);
	Funct: in std_logic_vector(4 downto 0);
	RegDst: out std_logic;
	Jump: out std_logic;
	Branch: out std_logic;
	MemRead: out std_logic;
	MemtoReg: out std_logic;
	ALUOp: out std_logic_vector(1 downto 0);
	MemWrite: out std_logic;
	ALUSrc: out std_logic;
	RegWrite: out std_logic;
	Enable: out std_logic;
	WriteModo: out std_logic_vector(1 downto 0)
);
end Control;

architecture Control of Control is

begin

process(Opcode)
begin
	
	case Opcode is
		when "00000" => --Instruction tipo R
			RegDst <= '1';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= '0';
			ALUOp <= "00";
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '1';
			Enable <= '0';
			WriteModo <= "10";
		when "00001" => --Instruction Seleccion Modo
			RegDst <= '0';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= '0';
			AluOp <= "00";
			MemWrite <= '1';
			AluSrc <= '1';
			RegWrite <= '0';
			Enable <= '0';
			WriteModo <= "00";
		when "00011" =>  --Instruction LW
			RegDst <= '0';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '1';
			MemtoReg <= '1';
			ALUOp <= "00";
			MemWrite <= '0';
			ALUSrc <= '1';
			RegWrite <= '1';
			Enable <= '1';
			WriteModo <= "10";
		when "01011" => --Instruction SW
			RegDst <= '0';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= '0';
			ALUOp <= "00";
			MemWrite <= '1';
			ALUSrc <= '1';
			RegWrite <= '0';
			Enable <= '1';
			WriteModo <= "10";
		when "01000" => --Instruction ADDI
			RegDst <= '0';
			Jump <= '0';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= '0';
			ALUOp <= "00";
			MemWrite <= '0';
			ALUSrc <= '1';
			RegWrite <= '1';
			Enable <= '1';
			WriteModo <= "10";
		when "00010" =>--Instruction J
			RegDst <= '0';
			Jump <= '1';
			Branch <= '0';
			MemRead <= '0';
			MemtoReg <= '0';
			ALUOp <= "00";
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '0';
			Enable <= '1';
			WriteModo <= "10";
		when "00100" =>--Instruction BEQ
			RegDst <= '0';
			Jump <= '0';
			Branch <= '1';
			MemRead <= '0';
			MemtoReg <= '0';
			ALUOp <= "01";
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '0';
			Enable <= '1';
			WriteModo <= "10";
		when "00101" =>--Instruction BNE
			RegDst <= '0';
			Jump <= '0';
			Branch <= '1';
			MemRead <= '0';
			MemtoReg <= '0';
			ALUOp <= "10";
			MemWrite <= '0';
			ALUSrc <= '0';
			RegWrite <= '0';
			Enable <= '1';
			WriteModo <= "10";
		when others => null;
	end case;

end process;

end Control;