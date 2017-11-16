LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity Deco7Seg is
port
(
	BCDSeg: in std_logic_vector(5 downto 0);
	BCDMin: in std_logic_vector(5 downto 0);
	SalidaSegU: out std_logic_vector(6 downto 0);
	SalidaSegD: out std_logic_vector(6 downto 0);
	SalidaMinU: out std_logic_vector(6 downto 0);
	SalidaMinD: out std_logic_vector(6 downto 0)
);
end entity;

architecture Deco7Seg of Deco7Seg is

begin

	process(BCDSeg, BCDMin)

	begin
	
			------ BCD SEGUNDOS --------------
			
			case BCDSeg is
			------- 0 al 9 -------------------
				when "000000" => --0
					SalidaSegU <= "1000000"; --0
					SalidaSegD <= "1000000";
				when "000001" => --1
					SalidaSegU <= "1111001"; --1
					SalidaSegD <= "1000000";
				when "000010" => --2
					SalidaSegU <= "0100100"; --2
					SalidaSegD <= "1000000";
				when "000011" => --3
					SalidaSegU <= "0110000"; --3
					SalidaSegD <= "1000000";
				when "000100" => --4
					SalidaSegU <= "0011001"; --4
					SalidaSegD <= "1000000";
				when "000101" => --5
					SalidaSegU <= "0010010"; --5
					SalidaSegD <= "1000000";
				when "000110" => --6
					SalidaSegU <= "0000010"; --6
					SalidaSegD <= "1000000";
				when "000111" => --7
					SalidaSegU <= "1111000"; --7
					SalidaSegD <= "1000000";
				when "001000" => --8
					SalidaSegU <= "0000000"; --8
					SalidaSegD <= "1000000";
				when "001001" => --9
					SalidaSegU <= "0010000"; --9
					SalidaSegD <= "1000000";
				------ 10 al 19 ----------------
				when "001010" => --10
					SalidaSegU <= "1000000"; 
					SalidaSegD <= "1111001";
				when "001011" => --11
					SalidaSegU <= "1111001";
					SalidaSegD <= "1111001";
				when "001100" => --12
					SalidaSegU <= "0100100";
					SalidaSegD <= "1111001";
				when "001101" => --13
					SalidaSegU <= "0110000";
					SalidaSegD <= "1111001";
				when "001110" => --14
					SalidaSegU <= "0011001";
					SalidaSegD <= "1111001";
				when "001111" => --15
					SalidaSegU <= "0010010";
					SalidaSegD <= "1111001";
				when "010000" => --16
					SalidaSegU <= "0000010";
					SalidaSegD <= "1111001";
				when "010001" => --17
					SalidaSegU <= "1111000";
					SalidaSegD <= "1111001";
				when "010010" => --18
					SalidaSegU <= "0000000";
					SalidaSegD <= "1111001";
				when "010011" => --19
					SalidaSegU <= "0010000";
					SalidaSegD <= "1111001";
				---- 20 al 29 -----------------
				when "010100" => --20
					SalidaSegU <= "1000000";
					SalidaSegD <= "0100100";
				when "010101" => --21
					SalidaSegU <= "1111001";
					SalidaSegD <= "0100100";
				when "010110" => --22
					SalidaSegU <= "0100100";
					SalidaSegD <= "0100100";
				when "010111" => --23
					SalidaSegU <= "0110000";
					SalidaSegD <= "0100100";
				when "011000" => --24
					SalidaSegU <= "0011001";
					SalidaSegD <= "0100100";
				when "011001" => --25
					SalidaSegU <= "0010010";
					SalidaSegD <= "0100100";
				when "011010" => --26
					SalidaSegU <= "0000010";
					SalidaSegD <= "0100100";
				when "011011" => --27
					SalidaSegU <= "1111000";
					SalidaSegD <= "0100100";
				when "011100" => --28
					SalidaSegU <= "0000000";
					SalidaSegD <= "0100100";
				when "011101" => --29
					SalidaSegU <= "0010000";
					SalidaSegD <= "0100100";
				---- 30 al 39 ----------------
				when "011110" => --30
					SalidaSegU <= "1000000";
					SalidaSegD <= "0110000";
				when "011111" => --31
					SalidaSegU <= "1111001";
					SalidaSegD <= "0110000";
				when "100000" => --32
					SalidaSegU <= "0100100";
					SalidaSegD <= "0110000";
				when "100001" => --33
					SalidaSegU <= "0110000";
					SalidaSegD <= "0110000";
				when "100010" => --34
					SalidaSegU <= "0011001";
					SalidaSegD <= "0110000";
				when "100011" => --35
					SalidaSegU <= "0010010";
					SalidaSegD <= "0110000";
				when "100100" => --36
					SalidaSegU <= "0000010";
					SalidaSegD <= "0110000";
				when "100101" => --37
					SalidaSegU <= "1111000";
					SalidaSegD <= "0110000";
				when "100110" => --38
					SalidaSegU <= "0000000";
					SalidaSegD <= "0110000";
				when "100111" => --39
					SalidaSegU <= "0010000";
					SalidaSegD <= "0110000";
				---- 40 al 49 --------------
				when "101000" => --40
					SalidaSegU <= "1000000";
					SalidaSegD <= "0011001";
				when "101001" => --41
					SalidaSegU <= "1111001";
					SalidaSegD <= "0011001";
				when "101010" => --42
					SalidaSegU <= "0100100";
					SalidaSegD <= "0011001";
				when "101011" => --43
					SalidaSegU <= "0110000";
					SalidaSegD <= "0011001";
				when "101100" => --44
					SalidaSegU <= "0011001";
					SalidaSegD <= "0011001";
				when "101101" => --45
					SalidaSegU <= "0010010";
					SalidaSegD <= "0011001";
				when "101110" => --46
					SalidaSegU <= "0000010";
					SalidaSegD <= "0011001";
				when "101111" => --47
					SalidaSegU <= "1111000";
					SalidaSegD <= "0011001";
				when "110000" => --48
					SalidaSegU <= "0000000";
					SalidaSegD <= "0011001";
				when "110001" => --49
					SalidaSegU <= "0010000";
					SalidaSegD <= "0011001";
				---- 50 al 59 ---------------
				when "110010" => --50
					SalidaSegU <= "1000000";
					SalidaSegD <= "0010010";
				when "110011" => --51
					SalidaSegU <= "1111001";
					SalidaSegD <= "0010010";
				when "110100" => --52
					SalidaSegU <= "0100100";
					SalidaSegD <= "0010010";
				when "110101" => --53
					SalidaSegU <= "0110000";
					SalidaSegD <= "0010010";
				when "110110" => --54
					SalidaSegU <= "0011001";
					SalidaSegD <= "0010010";
				when "110111" => --55
					SalidaSegU <= "0010010";
					SalidaSegD <= "0010010";
				when "111000" => --56
					SalidaSegU <= "0000010";
					SalidaSegD <= "0010010";
				when "111001" => --57
					SalidaSegU <= "1111000";
					SalidaSegD <= "0010010";
				when "111010" => --58
					SalidaSegU <= "0000000";
					SalidaSegD <= "0010010";
				when "111011" => --59
					SalidaSegU <= "0010000";
					SalidaSegD <= "0010010";
				when "111100" => --C
					SalidaSegU <= "1000110";
					SalidaSegD <= "1111111";
				when "111101" => --RE
					SalidaMinD <= "0001000";
					SalidaMinU <= "0000110";
				when others =>
					SalidaSegU <= "1111111";
					SalidaSegD <= "1111111";
			end case;
			
			----BCD MINUTOS -------------------
			
			case BCDMin is
			------- 0 al 9 -------------------
				when "000000" => --0
					SalidaMinU <= "1000000"; --0
					SalidaMinD <= "1000000";
				when "000001" => --1
					SalidaMinU <= "1111001"; --1
					SalidaMinD <= "1000000";
				when "000010" => --2
					SalidaMinU <= "0100100"; --2
					SalidaMinD <= "1000000";
				when "000011" => --3
					SalidaMinU <= "0110000"; --3
					SalidaMinD <= "1000000";
				when "000100" => --4
					SalidaMinU <= "0011001"; --4
					SalidaMinD <= "1000000";
				when "000101" => --5
					SalidaMinU <= "0010010"; --5
					SalidaMinD <= "1000000";
				when "000110" => --6
					SalidaMinU <= "0000010"; --6
					SalidaMinD <= "1000000";
				when "000111" => --7
					SalidaMinU <= "1111000"; --7
					SalidaMinD <= "1000000";
				when "001000" => --8
					SalidaMinU <= "0000000"; --8
					SalidaMinD <= "1000000";
				when "001001" => --9
					SalidaMinU <= "0010000"; --9
					SalidaMinD <= "1000000";
				------ 10 al 19 ----------------
				when "001010" => --10
					SalidaMinU <= "1000000"; 
					SalidaMinD <= "1111001";
				when "001011" => --11
					SalidaMinU <= "1111001";
					SalidaMinD <= "1111001";
				when "001100" => --12
					SalidaMinU <= "0100100";
					SalidaMinD <= "1111001";
				when "001101" => --13
					SalidaMinU <= "0110000";
					SalidaMinD <= "1111001";
				when "001110" => --14
					SalidaMinU <= "0011001";
					SalidaMinD <= "1111001";
				when "001111" => --15
					SalidaMinU <= "0010010";
					SalidaMinD <= "1111001";
				when "010000" => --16
					SalidaMinU <= "0000010";
					SalidaMinD <= "1111001";
				when "010001" => --17
					SalidaMinU <= "1111000";
					SalidaMinD <= "1111001";
				when "010010" => --18
					SalidaMinU <= "0000000";
					SalidaMinD <= "1111001";
				when "010011" => --19
					SalidaMinU <= "0010000";
					SalidaMinD <= "1111001";
				---- 20 al 29 -----------------
				when "010100" => --20
					SalidaMinU <= "1000000";
					SalidaMinD <= "0100100";
				when "010101" => --21
					SalidaMinU <= "1111001";
					SalidaMinD <= "0100100";
				when "010110" => --22
					SalidaMinU <= "0100100";
					SalidaMinD <= "0100100";
				when "010111" => --23
					SalidaMinU <= "0110000";
					SalidaMinD <= "0100100";
				when "011000" => --24
					SalidaMinU <= "0011001";
					SalidaMinD <= "0100100";
				when "011001" => --25
					SalidaMinU <= "0010010";
					SalidaMinD <= "0100100";
				when "011010" => --26
					SalidaMinU <= "0000010";
					SalidaMinD <= "0100100";
				when "011011" => --27
					SalidaMinU <= "1111000";
					SalidaMinD <= "0100100";
				when "011100" => --28
					SalidaMinU <= "0000000";
					SalidaMinD <= "0100100";
				when "011101" => --29
					SalidaMinU <= "0010000";
					SalidaMinD <= "0100100";
				---- 30 al 39 ----------------
				when "011110" => --30
					SalidaMinU <= "1000000";
					SalidaMinD <= "0110000";
				when "011111" => --31
					SalidaMinU <= "1111001";
					SalidaMinD <= "0110000";
				when "100000" => --32
					SalidaMinU <= "0100100";
					SalidaMinD <= "0110000";
				when "100001" => --33
					SalidaMinU <= "0110000";
					SalidaMinD <= "0110000";
				when "100010" => --34
					SalidaMinU <= "0011001";
					SalidaMinD <= "0110000";
				when "100011" => --35
					SalidaMinU <= "0010010";
					SalidaMinD <= "0110000";
				when "100100" => --36
					SalidaMinU <= "0000010";
					SalidaMinD <= "0110000";
				when "100101" => --37
					SalidaMinU <= "1111000";
					SalidaMinD <= "0110000";
				when "100110" => --38
					SalidaMinU <= "0000000";
					SalidaMinD <= "0110000";
				when "100111" => --39
					SalidaMinU <= "0010000";
					SalidaMinD <= "0110000";
				---- 40 al 49 --------------
				when "101000" => --40
					SalidaMinU <= "1000000";
					SalidaMinD <= "0011001";
				when "101001" => --41
					SalidaMinU <= "1111001";
					SalidaMinD <= "0011001";
				when "101010" => --42
					SalidaMinU <= "0100100";
					SalidaMinD <= "0011001";
				when "101011" => --43
					SalidaMinU <= "0110000";
					SalidaMinD <= "0011001";
				when "101100" => --44
					SalidaMinU <= "0011001";
					SalidaMinD <= "0011001";
				when "101101" => --45
					SalidaMinU <= "0010010";
					SalidaMinD <= "0011001";
				when "101110" => --46
					SalidaMinU <= "0000010";
					SalidaMinD <= "0011001";
				when "101111" => --47
					SalidaMinU <= "1111000";
					SalidaMinD <= "0011001";
				when "110000" => --48
					SalidaMinU <= "0000000";
					SalidaMinD <= "0011001";
				when "110001" => --49
					SalidaMinU <= "0010000";
					SalidaMinD <= "0011001";
				---- 50 al 59 ---------------
				when "110010" => --50
					SalidaMinU <= "1000000";
					SalidaMinD <= "0010010";
				when "110011" => --51
					SalidaMinU <= "1111001";
					SalidaMinD <= "0010010";
				when "110100" => --52
					SalidaMinU <= "0100100";
					SalidaMinD <= "0010010";
				when "110101" => --53
					SalidaMinU <= "0110000";
					SalidaMinD <= "0010010";
				when "110110" => --54
					SalidaMinU <= "0011001";
					SalidaMinD <= "0010010";
				when "110111" => --55
					SalidaMinU <= "0010010";
					SalidaMinD <= "0010010";
				when "111000" => --56
					SalidaMinU <= "0000010";
					SalidaMinD <= "0010010";
				when "111001" => --57
					SalidaMinU <= "1111000";
					SalidaMinD <= "0010010";
				when "111010" => --58
					SalidaMinU <= "0000000";
					SalidaMinD <= "0010010";
				when "111011" => --59
					SalidaMinU <= "0010000";
					SalidaMinD <= "0010010";
				when "111100" => --T
					SalidaMinU <= "1111111";
					SalidaMinD <= "0000111";
				when "111101" => --ER
					SalidaMinD <= "0000110";
					SalidaMinU <= "0001000";
				when "111110" => --OP
					SalidaMinD <= "1000000";
					SalidaMinU <= "0001100";
				when "111111" => --E
					SalidaMinD <= "0000110";
					SalidaMinU <= "1111111";
				when others =>
					SalidaMinU <= "1111111";
					SalidaMinD <= "1111111";
			end case;
	end process;

end architecture;