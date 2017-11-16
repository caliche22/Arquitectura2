LIBRARY IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

LIBRARY work;

entity ProcesadorMonociclo is
port
(
	Clock: in std_logic;
	ResetClock: in std_logic;
	ResetPC: in std_logic;
	Pulsador: in std_logic;
	SwitchesModo: in std_logic_vector(1 downto 0);
	SwitchesDatos: in std_logic_vector(7 downto 0)
);
end entity;

architecture ProcesadorMonociclo of ProcesadorMonociclo is

--Control
signal RegDst: std_logic;
signal Is_Jump: std_logic;
signal Branch: std_logic;
signal MemRead: std_logic;
signal MemtoReg: std_logic;
signal ALUOp: std_logic_vector(1 downto 0);
signal MemWrite: std_logic;
signal ALUSrc: std_logic;
signal RegWrite: std_logic;
signal Enable: std_logic;
signal WriteModo: std_logic_vector(1 downto 0);

--AntiRebote
--signal SalidaAnti: std_logic;

--MUXDATARAM
signal SalidaMUXRAM: std_logic_vector(24 downto 0);

--Completar30Bits
signal SalidaWriteData: std_logic_vector(24 downto 0);

--CompletarBITS
signal SalidaDatosMS: std_logic_vector(24 downto 0);

--PC
signal PCLectura: std_logic_vector(24 downto 0);
signal PCSiguiente: std_logic_vector(24 downto 0);

--InstructionMemory
signal Instruction: std_logic_vector(24 downto 0);

--DataMemory
signal ReadData: std_logic_vector(24 downto 0);
signal ReadDataSEG: std_logic_vector(24 downto 0);
signal ReadDataMIN: std_logic_vector(24 downto 0);

--SignExtend
signal ConstanteOut: std_logic_vector(24 downto 0);

--JumpBox
signal JumpOut:std_logic_vector(24 downto 0);

--RegisterFile
signal WriteRegister: std_logic_vector(4 downto 0);
signal WriteData: std_logic_vector(24 downto 0);
signal ReadData1: std_logic_vector(24 downto 0);
signal ReadData2: std_logic_vector(24 downto 0);

--ALU
signal Zero: std_logic;
signal Resultado: std_logic_vector(24 downto 0);
signal SalidaMUXALU: std_logic_vector(24 downto 0);

--AdderPC
signal CuatroBits: std_logic_vector(24 downto 0);
signal PCSumado4: std_logic_vector(24 downto 0);

--MUXBranch
signal SelectorMUXBranch: std_logic;
signal PCorBranch: std_logic_vector(24 downto 0);

signal Suma1Bit: std_logic_vector(24 downto 0); 

signal ClockOut: std_logic;

begin



CompletaBITS: entity work.CompleteBits(CompleteBits)
port map
(
	Valor1 => SwitchesDatos,
	SalidaData => SalidaDatosMS
);

DivisorFrec: entity work.DivisorFrecuencia(DivisorFrecuencia)
port map
(
	Clock => Clock,
	ClockOut => ClockOut,
	Reset => ResetClock
);

PC: entity work.PC(PC)
port map
(
	Clock => ClockOut,
	--EnableModo => SalidaAnti,
	Enable => Enable,
	ResetPC => ResetPC,
	PCOut => PCLectura,
	PCIn => PCSiguiente
);

CuatroBitsAdderPC: entity work.CuatroBits(CuatroBits)
port map
(
	Salida => Suma1Bit
);

AdderPC: entity work.Adder(Adder)
port map
(
	Valor1IN => PCLectura,
	Valor2IN => Suma1Bit,
	ValorSalida => PCSumado4
);

InstructionMemory: entity work.InstructionMemory(InstructionMemory)
port map
(
	Address => PCLectura,
	Instruction => Instruction
);

ANDBranch: entity work.ANDBranch(ANDBranch)
port map
(
	Branch => Branch,
	Zero => Zero,
	Salida => SelectorMUXBranch
);

MUXDATARAM: entity work.MUXInput(MUXInput)
port map
(
	Sel => WriteModo,
	Entrada0 => SalidaWriteData,
	Entrada1 => SalidaDatosMS,
	Entrada2 => ReadData2,
	Salida => SalidaMUXRAM
);

Completa25BITS: entity work.Complete25Bits(Complete25Bits)
port map
(
	Valor1MUX => SwitchesModo,
	SalidaWriteData => SalidaWriteData
);

MUXBranch: entity work.MUX(MUX)
port map
(
	Sel => SelectorMUXBranch,
	Entrada0 => PCSumado4,
	Entrada1 => ConstanteOut,
	Salida => PCorBranch
);

ShiftLeft2Jump: entity work.Jump(Jump)
port map
(
	JumpIn => Instruction(7 downto 0),
	JumpOut => JumpOut
);

MUXJumpBranch: entity work.MUX(MUX)
port map
(
	Sel => Is_Jump,
	Entrada0 => PCorBranch,
	Entrada1 => JumpOut,
	Salida => PCSiguiente
);

Control: entity work.Control(Control)
port map
(
	Opcode => Instruction(24 downto 20),
	Funct => Instruction(4 downto 0),
	RegDst => RegDst,
	Jump => Is_Jump,
	Branch => Branch,
	MemRead => MemRead,
	MemtoReg => MemtoReg,
	ALUOp => AluOp,
	MemWrite => MemWrite,
	ALUSrc => ALUSrc,
	RegWrite => RegWrite,
	Enable => Enable,
	WriteModo => WriteModo
);

SignExt: entity work.SignExtend(SignExtend)
port map
(
	Constante => Instruction(7 downto 0),
	ConstanteOut => ConstanteOut
);

MUXRF: entity work.MUXRF(MUXRF)
port map
(
	RegDst => RegDst,
	RT => Instruction(14 downto 10),
	RD => Instruction(9 downto 5),
	WriteRegister => WriteRegister
);

RegisterFile: entity work.RegisterFile(RegisterFile)
port map
(
	Clock => ClockOut,
	RegWrite => RegWrite,
	WriteRegister => WriteRegister,
	ReadRegister1 => Instruction(19 downto 15),
	ReadRegister2 => Instruction(14 downto 10),
	WriteData => WriteData,
	ReadData1 => ReadData1,
	ReadData2 => ReadData2
);

MUXALU: entity work.MUX(MUX)
port map
(
	Sel => AluSrc,
	Entrada0 => ReadData2,
	Entrada1 => ConstanteOut,
	Salida => SalidaMUXALU
);

ALU: entity work.ALU(ALU)
port map
(
	Valor1 => ReadData1,
	Valor2 => SalidaMUXALU,
	AluOp => AluOp,
	Resultado => Resultado,
	Zero => Zero
);

DataMemory: entity work.DataMemory(DataMemory)
port map
(
	Clock => ClockOut,
	MemWrite => MemWrite,
	MemRead => MemRead,
	WriteData => SalidaMUXRAM,
	Address => Resultado,
	ReadData => ReadData
	
);

MUXRAM: entity work.MUX
port map
(
	Sel => MemtoReg,
	Entrada0 => Resultado,
	Entrada1 => ReadData,
	Salida => WriteData
);
end architecture;