library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagealu00 is

	component topdiv00
		port(
			cdiv0: in std_logic_vector (4 downto 0);
			clk0: inout std_logic
		);
	end component;
	
	component anda00
		port(
			clka: in std_logic;
			inFlaga: in std_logic;
			functa: in std_logic_vector (5 downto 0);
			inrsa:  in std_logic_vector (7 downto 0);
			inrta:  in std_logic_vector (7 downto 0);			
			outrda:  out std_logic_vector (7 downto 0);
			outFlaga: out std_logic
		);
	end component;
	
	component ora00
		port(
			clko: in std_logic;
			inFlago: in std_logic;
			functo: in std_logic_vector (5 downto 0);
			inrso:  in std_logic_vector (7 downto 0);
			inrto:  in std_logic_vector (7 downto 0);			
			outrdo:  out std_logic_vector (7 downto 0);
			outFlago: out std_logic
		);
	end component;

	component ac00
		port(
				clkac: in std_logic;
				enableac: in std_logic;
				inFlagac: in std_logic;
				inac8bits: in std_logic_vector(7 downto 0);
				inac16bits: in std_logic_vector(15 downto 0);
				inFlag16bits: std_logic;
				outac: out std_logic_vector(15 downto 0);
				outFlagac: out std_logic
			);
	end component;
	
	component xora00 
		port(
				clkxo: in std_logic;
				inFlagxo: in std_logic;
				functxo: in std_logic_vector (5 downto 0);
				inrsxo:  in std_logic_vector (7 downto 0);
				inrtxo:  in std_logic_vector (7 downto 0);			
				outrdxo:  out std_logic_vector (7 downto 0);
				outFlagxo: out std_logic
			);
	end component;
	----------------------------------------
	component nanda00 is
		port(
				clkna: in std_logic;
				inFlagna: in std_logic;
				functna: in std_logic_vector (5 downto 0);
				inrsna:  in std_logic_vector (7 downto 0);
				inrtna:  in std_logic_vector (7 downto 0);			
				outrdna:  out std_logic_vector (7 downto 0);
				outFlagna: out std_logic
			);
	end component;
	component nora00
		port(
				clknor: in std_logic;
				inFlagnor: in std_logic;
				functnor: in std_logic_vector (5 downto 0);
				inrsnor:  in std_logic_vector (7 downto 0);
				inrtnor:  in std_logic_vector (7 downto 0);			
				outrdnor:  out std_logic_vector (7 downto 0);
				outFlagnor: out std_logic
			);
	end component;
	component xnora00
		port(
				clkxno: in std_logic;
				inFlagxno: in std_logic;
				functxno: in std_logic_vector (5 downto 0);
				inrsxno:  in std_logic_vector (7 downto 0);
				inrtxno:  in std_logic_vector (7 downto 0);			
				outrdxno:  out std_logic_vector (7 downto 0);
				outFlagxno: out std_logic
			);
	end component;
	component nota00
		port(
				clkno: in std_logic;
				inFlagno: in std_logic;
				functno: in std_logic_vector (5 downto 0);
				inrsno:  in std_logic_vector (7 downto 0);			
				outrdno:  out std_logic_vector (7 downto 0);
				outFlagno: out std_logic
			);
	end component;
	component topadder8bit00
		port(
			Ai: in std_logic_vector(7 downto 0);
			Bi: in std_logic_vector(7 downto 0);
			SL:in std_logic;
			So: out std_logic_vector(7 downto 0);
			LED:out std_logic
		);
	end component;
	component adda00
		port(
				clkad: in std_logic;
				inFlagad: in std_logic;
				functad: in std_logic_vector (5 downto 0);
				inrsad:  in std_logic_vector (7 downto 0);
				inrtad:  in std_logic_vector (7 downto 0);		
				inLED: in std_logic;
				inSo: in std_logic_vector(7 downto 0);
				--SALIDA HACIA EL ACUMULADOR
				outrdad:  out std_logic_vector (7 downto 0);
				--SALIDA DEL SIGNO AL ADDER
				outSL: out std_logic;
				--SALE AL ADDER
				outRS: out std_logic_vector(7 downto 0);
				outRT: out std_logic_vector(7 downto 0);
				outLEDad: out std_logic;
				outFlagad: out std_logic
			);
	end component;
	component subst00
		port(
				clksb: in std_logic;
				inFlagsb: in std_logic;
				functsb: in std_logic_vector (5 downto 0);
				inrssb:  in std_logic_vector (7 downto 0);
				inrtsb:  in std_logic_vector (7 downto 0);		
				inLED: in std_logic;
				inSo: in std_logic_vector(7 downto 0);
				--SALIDA HACIA EL ACUMULADOR
				outrdsb:  out std_logic_vector (7 downto 0);
				--SALIDA DEL SIGNO AL ADDER
				outSL: out std_logic;
				--SALE AL ADDER
				outRS: out std_logic_vector(7 downto 0);
				outRT: out std_logic_vector(7 downto 0);
				outLEDsb: out std_logic;
				outFlagsb: out std_logic
			);
	end component;
	component multa00
		port(
				clkml: in std_logic;
				inFlagml: in std_logic;
				functml: in std_logic_vector (5 downto 0);
				inrsml:  in std_logic_vector (7 downto 0);
				inrtml:  in std_logic_vector (7 downto 0);
				inSo: in std_logic_vector(15 downto 0);
				--SALIDA HACIA EL ACUMULADOR
				outrdml:  out std_logic_vector (15 downto 0);
				
				--SALE AL MULTIPLICADOR
				outRS: out std_logic_vector(7 downto 0);
				outRT: out std_logic_vector(7 downto 0);
				outFlag16bits: out std_logic;
				outFlagml: out std_logic
			);
	end component;
	component mult8bit00
		port(
			 Am :in std_logic_vector (7 downto 0);
			 Bm :in std_logic_vector (7 downto 0);
			 Rm :out std_logic_vector (15 downto 0)
			 );
	end component;
end packagealu00;