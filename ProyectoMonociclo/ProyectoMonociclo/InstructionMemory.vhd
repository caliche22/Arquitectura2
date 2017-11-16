LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity InstructionMemory is
port
(
	Address: in std_logic_vector(24 downto 0);
	Instruction: out std_logic_vector(24 downto 0)
);
end entity;

architecture InstructionMemory of InstructionMemory is
	
	type ROM is array (0 to 120) of std_logic_vector(24 downto 0);
	signal MemoriaRom : ROM := 
	(
		0 => "0010000000001110000000000",
		1 => "0010000000001111000000000",
		2 => "0010000000011001000000000",
		3 => "0010000000010110000000000",
		4 => "1010110000001111000000000",
		5 => "1010110000011001000000000",
		6 => "0000010000000000000000000",
		7 => "1000110000011000000000000",
		8 => "0001001100001110000000000",
		9 => "0001001100001111000000000",
		10=> "0001001100010110000000000",
		11=> "0000100000000000000000000",
		12=> "0010000000010000000000000",
		13=> "0010000000011001000000000",
		14=> "0010000000001111000000000",
		15=> "1010110000011001000000000",
		16=> "1010110000010000000000000",
		17=> "1010110000001111000000000",
		18=> "1010110000001111000000000",
		19=> "0000110000001000000000000",
		20=> "1000110000001000000000000",
		21=> "0000110000001001000000000",
		22=> "1000110000001001000000000",
		23=> "0010000000001100000000000",
		24=> "0010000110101101000000000",
		25=> "0010000101001010000000000",
		26=> "0001000100101101000000000",
		27=> "0001000100001101000000000",
		28=> "0010000100001000111111111",
		29=> "1010110000001000000000000",
		30=> "0000100000000000000000000",
		31=> "0001000100101101000000000",
		32=> "0010000100101001111111111",
		33=> "1010110000001001000000000",
		34=> "0010000100001000000000000",
		35=> "1010110000001000000000000",
		36=> "0000100000000000000000000",
		37=> "0001000110001010000000000",
		38=> "0001000100001101000000000",
		39=> "0001010100001101000000000",
		40=> "0010000110001100000000000",
		41=> "0010000100001000111111111",
		42=> "1010110000001000000000000",
		43=> "0001000100001101000000000",
		44=> "0000100000000000000000000",
		45=> "0001000111100000000000000",
		46=> "0001010111100000000000000",
		47=> "0010000000010000000000000",
		48=> "1010110000010000000000000",
		49=> "1010110000011001000000000",
		50=> "0010000000001000000000000",
		51=> "1010110000001000000000000",
		52=> "0010000000001001000000000",
		others => "0000000000000000000000000"
	);
	
	begin
		Instruction <= MemoriaRom(conv_integer(Address));
		
end architecture;
	