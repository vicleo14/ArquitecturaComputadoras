library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagealu00.all;

entity topalu00 is
port(
		clk00: inout std_logic;
		enable0:in std_logic;
		cdiv00: in std_logic_vector(4 downto 0);
		funct0: in std_logic_vector(5 downto 0);
		inregRS0: in std_logic_vector(7 downto 0);
		inregRT0: in std_logic_vector(7 downto 0);
		outalu0: out std_logic_vector(15 downto 0);
		outFlagInst0: inout std_logic;
		outFlagac0: inout std_logic;
		outLED: out std_logic;
		outRSum: out std_logic_vector(7 downto 0)
	);
end topalu00;

architecture topalu0 of topalu00 is
signal sdata: std_logic_vector(7 downto 0);
signal sdata16bits:std_logic_vector(15 downto 0);
signal opA,opB,sresultAdder: std_logic_vector(7 downto 0);
signal sLED1,sLED2,sSL: std_logic;
signal opA16,opB16: std_logic_vector(7 downto 0);
signal sresultMult: std_logic_vector(15 downto 0);
signal s1632bits:std_logic;
begin
	outLED<=sLED2;
	outRSum<=sresultAdder;
	AL00: topdiv00 port map(clk0 => clk00,
							cdiv0 => cdiv00
							);
	
	AL01: anda00 port map(clka => clk00,
							inFlaga => outFlagac0,
							functa => funct0,
							inrsa =>  inregRS0,
							inrta  => inregRT0,
							outrda => sdata,
							outFlaga => outFlagInst0
						);

	AL02: ora00 port map(clko => clk00,
							inFlago => outFlagac0,
							functo => funct0,
							inrso =>  inregRS0,
							inrto  => inregRT0, 
							outrdo => sdata,
							outFlago => outFlagInst0
							);
	
	AL03: ac00 port map(clkac => clk00,
							enableac => enable0,
							inFlagac => outFlagInst0,
							inac8bits => sdata,
							inac16bits => sdata16bits,
							inFlag16bits=>s1632bits,
							outac => outalu0,
							outFlagac => outFlagac0
						);
	AL04: xora00 port map(
			clkxo=>clk00,
			inFlagxo=>outFlagac0,
			functxo=>funct0,
			inrsxo=>inregRS0,
			inrtxo=>inregRT0,	
			outrdxo=>sdata,
			outFlagxo=>outFlagInst0
		);
	AL05: nanda00 port map(
			clkna=>clk00,
			inFlagna=>outFlagac0,
			functna=>funct0,
			inrsna=>inregRS0,
			inrtna=>inregRT0,	
			outrdna=>sdata,
			outFlagna=>outFlagInst0
		);
		AL06: nora00 port map(
			clknor=>clk00,
			inFlagnor=>outFlagac0,
			functnor=>funct0,
			inrsnor=>inregRS0,
			inrtnor=>inregRT0,	
			outrdnor=>sdata,
			outFlagnor=>outFlagInst0
		);
		AL07: xnora00 port map(
			clkxno=>clk00,
			inFlagxno=>outFlagac0,
			functxno=>funct0,
			inrsxno=>inregRS0,
			inrtxno=>inregRT0,	
			outrdxno=>sdata,
			outFlagxno=>outFlagInst0
		);
		AL08: nota00 port map(
			clkno=>clk00,
			inFlagno=>outFlagac0,
			functno=>funct0,
			inrsno=>inregRS0,	
			outrdno=>sdata,
			outFlagno=>outFlagInst0
		);
		AL09:topadder8bit00 port map
		(
			Ai=>opA,
			Bi=>opB,
			SL=>sSL,
			So=>sresultAdder,
			LED=>sLED1
		);
		AL10: adda00 port map
		(
				clkad=>clk00,
				inFlagad=>outFlagac0,
				functad=>funct0,
				inrsad=>inregRS0,
				inrtad=>inregRT0,		
				--ENTRADAS DESDE EL ADDER
				inLED=>sLED1,
				inSo=>sresultAdder,
				--SALIDA HACIA EL ACUMULADOR
				outrdad=>sdata,
				--SALIDA DEL SIGNO AL ADDER
				outSL=>sSL,
				--SALE AL ADDER
				outRS=>opA,
				outRT=>opB,
				--SALE AL 
				outLEDad=>sLED2,
				outFlagad=>outFlagInst0
			);
			AL11: subst00 port map
			(
					clksb=>clk00,
					inFlagsb=>outFlagac0,
					functsb=>funct0,
					inrssb=>inregRS0,
					inrtsb=>inregRT0,		
					--ENTRADAS DESDE EL ADDER
					inLED=>sLED1,
					inSo=>sresultAdder,
					--SALIDA HACIA EL ACUMULADOR
					outrdsb=>sdata,
					--SALIDA DEL SIGNO AL ADDER
					outSL=>sSL,
					--SALE AL ADDER
					outRS=>opA,
					outRT=>opB,
					--SALE AL 
					outLEDsb=>sLED2,
					outFlagsb=>outFlagInst0
				);
				-----------------------------------------------MULTIPLICADOR
			AL12: multa00 port map(
				clkml=>clk00,
				inFlagml=>outFlagac0,
				functml=>funct0,
				inrsml=>inregRS0,
				inrtml=>inregRT0,
				--REGRESA DEL MULTIPLICADOR
				inSo=>sresultMult,
				--SALIDA HACIA EL ACUMULADOR
				outrdml=>sdata16bits,
				
				--SALE AL MULTIPLICADOR
				outRS=>opA16,
				outRT=>opB16,
				outFlag16bits=>s1632bits,
				outFlagml=>outFlagInst0
			);
			AL13: mult8bit00 port map(
				 Am =>opA16,
				 Bm =>opB16,
				 Rm =>sresultMult
			 );

end topalu0;