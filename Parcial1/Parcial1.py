from sys import stdin

diccionario = {"R1" : "00000", "R2" : "00001", "R3" : "00010", "R4" : "00011", "R5" : "00100", "R6" : "00101", "R7" : "00110", "R8" : "00111", "R9" : "01000", "R10" : "01001", "R11" : "01010", "R12" : "01011", "R13" : "01100", "R14" : "01101", "R15" : "01110", "R16" : "01111", "R17" : "10000", "R18" : "10001", "R19" : "10010", "R20" : "10011", "R21" : "10100", "R22" : "10101", "R23" : "10110", "R24" : "10111", "R25" : "11000", "R26" : "11001", "R27" : "11010", "R28" : "11011", "R29" : "11100", "R30" : "11101", "R31" : "11110", "R32" : "11111"};
cerosConstante = "000000000000000";
cerosOpcode = "0000000";
registros = "00000";
saltoJump = "0000000000000000000000000";
saltoBranch = "000000000000000";
def calcularSaltoJump(direccion):
	global saltoJump;
	ans = saltoJump[0:len(saltoJump)-len(direccion)]+str(direccion);
	return ans;

def calcularSaltoBranch(direccion):
	global saltoBranch;
	ans = saltoBranch[0:len(saltoBranch)-len(direccion)]+str(direccion);
	return ans;

def calcularConstante(constante):
	global cerosConstante;
	ans = "";
	binario = bin(int(constante))[2:];
	corte = len(binario);
	ans = cerosConstante[0:len(cerosConstante)-len(binario)]+str(binario);
	return ans;

def calcularOpcode(opcode):
	global cerosOpcode;
	ans = "";
	binario = bin(int(opcode))[2:];
	corte = len(binario);
	ans = cerosOpcode[0:len(cerosOpcode)-len(binario)]+str(binario);
	return ans;

def decodificarRegistros(registros):
	global diccionario;
	ans = "";
	i = 0;
	while(i != len(registros)):
		ans += diccionario.get(registros[i]);
		i += 1;
	return ans;

def decodificarBranch(instruccion):
	ans = "";
	if(instruccion[0] == "BRM"):
		ans += "0110001";
	elif(instruccion[0] == "BRI"):
		ans += "0110010";
	else:
		ans += "0110011";

	ans += decodificarRegistros(instruccion[1:3]);
	ans += instruccion[3];
	return ans;

def decodificarShift(instruccion):
	ans = "";
	if(instruccion[0] == "SHL"):
		ans += "0110100";
	else:
		ans += "0110101";

	ans += decodificarRegistros(instruccion[1:3]);
	ans += calcularConstante(instruccion[3]);
	return ans;

def decodificarOpcode(instruccion,tipo):
	if(tipo == 0):
		valor = 0;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+7));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+14));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+21));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+28));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+35));
		else:
			return(calcularOpcode(valor+42));
	elif(tipo == 1):
		valor = 1;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+7));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+14));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+21));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+28));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+35));
		else:
			return(calcularOpcode(valor+42));
	elif(tipo == 2):
		valor = 2;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+7));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+14));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+21));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+28));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+35));
		else:
			return(calcularOpcode(valor+42));
	elif(tipo == 3):
		valor = 3;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+7));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+14));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+21));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+28));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+35));
		else:
			return(calcularOpcode(valor+42));
	elif(tipo == 4):
		valor = 4;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+7));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+14));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+21));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+28));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+35));
		else:
			return(calcularOpcode(valor+42));
	elif(tipo == 5):
		valor = 5;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+7));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+14));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+21));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+28));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+35));
		else:
			return(calcularOpcode(valor+42));
	elif(tipo == 6):
		valor = 6;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+7));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+14));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+21));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+28));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+35));
		else:
			return(calcularOpcode(valor+42));
	elif(tipo == 7):
		valor = 56;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+4));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+8));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+12));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+16));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+20));
		else:
			return(calcularOpcode(valor+24));
	elif(tipo == 8):
		valor = 57;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+4));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+8));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+12));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+16));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+20));
		else:
			return(calcularOpcode(valor+24));
	elif(tipo == 9):
		valor = 58;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+4));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+8));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+12));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+16));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+20));
		else:
			return(calcularOpcode(valor+24));
	elif(tipo == 10):
		valor = 59;
		if(instruccion == "ADD"):
			return(calcularOpcode(valor));
		elif(instruccion == "SUB"):
			return(calcularOpcode(valor+4));
		elif(instruccion == "AND"):
			return(calcularOpcode(valor+8));
		elif(instruccion == "OR"):
			return(calcularOpcode(valor+12));
		elif(instruccion == "MUL"):
			return(calcularOpcode(valor+16));
		elif(instruccion == "DIV"):
			return(calcularOpcode(valor+20));
		else:
			return(calcularOpcode(valor+24));
	elif(tipo == 11):
		if(instruccion == "ADD"):
			return(calcularOpcode(85));
		elif(instruccion == "SUB"):
			return(calcularOpcode(86));
		elif(instruccion == "AND"):
			return(calcularOpcode(89));
		elif(instruccion == "OR"):
			return(calcularOpcode(90));
		elif(instruccion == "MUL"):
			return(calcularOpcode(87));
		elif(instruccion == "DIV"):
			return(calcularOpcode(88));
		else:
			return(calcularOpcode(84));

def decodificarOtros(instruccion):
	global registros;
	ans = "";
	if(instruccion[1][0] == "R" and instruccion[2][0] == "R"): #ADD R1 R2
		ans += decodificarOpcode(instruccion[0],0);
		ans += decodificarRegistros(instruccion[1:3]);
		ans += calcularConstante(0);
	elif(instruccion[1][0] == "R" and instruccion[2][0] != "R" and instruccion[2][0] != "[" and "R" not in instruccion[2]): #ADD R1 2
		ans += decodificarOpcode(instruccion[0],1);
		ans += decodificarRegistros([instruccion[1]]);
		ans += registros;
		ans += calcularConstante(instruccion[2]);
	elif(instruccion[1][0] == "[" and '+' not in instruccion[1] and instruccion[2][0] == "R" and 'R' in instruccion[1]): #ADD [R1] R2
		ans += decodificarOpcode(instruccion[0],2);
		ans += decodificarRegistros([instruccion[1][1:len(instruccion[1])-1], instruccion[2]]);
		ans += calcularConstante(0);
	elif(instruccion[1][0] == "[" and '+' in instruccion[1][0] and instruccion[2][0] == "R"): #ADD [R1+2] R2
		RC = instruccion[1].split('+');
		ans += decodificarOpcode(instruccion[0],3);
		ans += decodificarRegistros([RC[0][1:], instruccion[2]]);
		ans += calcularConstante(RC[1][:len(RC[1])-1]);
	elif(instruccion[1][0] == "R" and instruccion[2][0] == "[" and '+' not in instruccion[2] and 'R' in instruccion[2]): #ADD R2 [R1]
		ans += decodificarOpcode(instruccion[0],4);
		ans += decodificarRegistros([instruccion[1], instruccion[2][1:len(instruccion[2])-1]]);
		ans += calcularConstante(0);
	elif(instruccion[1][0] == "R" and instruccion[2][0] == "[" and '+' in instruccion[2]): #ADD R2 [R1+2]
		RC = instruccion[2].split('+');
		ans += decodificarOpcode(instruccion[0],5);
		ans += decodificarRegistros([instruccion[2], RC[0][1:]]);
		ans += calcularConstante(RC[1][:len(RC[1])-1]);
	elif(instruccion[1][0] == "[" and instruccion[2][0] == "[" and '+' not in instruccion[1] and '+' not in instruccion[2]): #ADD [R1] [R2]
		ans += decodificarOpcode(instruccion[0],6);
		ans += decodificarRegistros([instruccion[1][1:len(instruccion[1])-1],instruccion[2][1:len(instruccion[2])-1]]);
		ans += calcularConstante(0);
	elif(instruccion[1][0] == "R" and instruccion[2][0] == "[" and 'R' not in instruccion[2]): #ADD R1 [20]
		ans += decodificarOpcode(instruccion[0],7);
		ans += decodificarRegistros([instruccion[1]]);
		ans += registros;
		ans += calcularConstante(instruccion[2][1:len(instruccion[2])-1]);
	elif(instruccion[1][0] == "[" and 'R' in instruccion[1] and instruccion[2][0] == "[" and 'R' not in instruccion[2]): #ADD [R1] [2]
		ans += decodificarOpcode(instruccion[0],8);
		ans += decodificarRegistros([instruccion[1][1:len(instruccion[1])-1]]);
		ans += registros;
		ans += calcularConstante(instruccion[2][1:len(instruccion[2])-1]);
	elif(instruccion[1][0] == "[" and 'R' not in instruccion[1][0] and instruccion[2][0] == "R"): #ADD [10] R2
		ans += decodificarOpcode(instruccion[0],9);
		ans += registros;
		ans += decodificarRegistros([instruccion[2]]);
		ans += calcularConstante(instruccion[1:len(instruccion[1])-1]); 
	elif(instruccion[1][0] == "[" and "R" not in instruccion[1] and instruccion[2][0] == "[" and 'R' in instruccion[2] and '+' not in instruccion[2]): #ADD [25] [R2]
		ans += decodificarOpcode(instruccion[0],10);
		ans += registros;
		ans += decodificarRegistros([instruccion[2][1:len(instruccion[2])-1]]);
		ans += calcularConstante(instruccion[1][1:len(instruccion[1])-1]);
	elif(instruccion[1][0] == "[" and '+' in instruccion[1] and instruccion[2][0] == "[" and '+' not in instruccion[2] and 'R' in instruccion[2]): #ADD [R1+2] [R2]
		RC = instruccion[1].split('+');
		ans += decodificarOpcode(instruccion[0],11);
		ans += decodificarRegistros([RC[0][1:], instruccion[2][1:len(instruccion[2])-1]]);
		ans += calcularConstante(RC[1][:len(RC[0])-1]);
	return ans;

def decoder(instruccion):
	ans = "";
	if(len(instruccion) == 2): #JUMP HOLA
		ans += "0110111"+instruccion[1];
	elif(len(instruccion) == 1): #NOP
		ans += "11011000000000000000000000000000";
	elif(len(instruccion) == 4): 
		if(instruccion[0][0] == "B"): #BRM, BRI, BRME
			ans += decodificarBranch(instruccion);
		else: #SHL, SHR
			ans += decodificarShift(instruccion);
	else: #ADD, SUB, AND, OR, MUL, DIV, MOV
		ans += decodificarOtros(instruccion);
	return ans;

def main():
	inp = stdin;
	linea = inp.readline();
	contador = 0;
	labels = {};
	ans = [];
	while(linea != ""):
		instruccion = linea.split();
		if(linea != "\n"):
			if(instruccion[0][0] == "@"):
				labels[instruccion[0][1:]] = bin(contador)[2:];
				ans.append(decoder(instruccion[1:]));
			else:
				ans.append(decoder(instruccion));
			contador += 1;
		linea = inp.readline();

	ans2 = [];
	i = 0;
	while(i != len(ans)):
		if(ans[i][0:7] == "0110111"):
			ans2.append(ans[i][0:7]+calcularSaltoJump(labels.get(ans[i][7:])));
		elif(ans[i][0:7] == "0110001"):
			ans2.append(ans[i][0:17]+calcularSaltoBranch(labels.get(ans[i][17:])));
		elif(ans[i][0:7] == "0110010"):
			ans2.append(ans[i][0:17]+calcularSaltoBranch(labels.get(ans[i][17:])));
		elif(ans[i][0:7] == "0110011"):
			ans2.append(ans[i][0:17]+calcularSaltoBranch(labels.get(ans[i][17:])));
		else:
			ans2.append(ans[i]);
		i += 1;
	print('\n'.join(ans2));
main();