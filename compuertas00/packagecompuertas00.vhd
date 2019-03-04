library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

PACKAGE packagecompuertas00 is
	component and00 is
		port
		(
			Aa:in std_logic_vector(7 downto 0);
			Ba:in std_logic_vector(7 downto 0);
			Ya:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component or00 is
		port
		(
			Ao:in std_logic_vector(7 downto 0);
			Bo:in std_logic_vector(7 downto 0);
			Yo:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component xor00 is
		port
		(
			Axo:in std_logic_vector(7 downto 0);
			Bxo:in std_logic_vector(7 downto 0);
			Yxo:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component nor00 is
		port
		(
			Ano:in std_logic_vector(7 downto 0);
			Bno:in std_logic_vector(7 downto 0);
			Yno:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component nand00 is
		port
		(
			Ana:in std_logic_vector(7 downto 0);
			Bna:in std_logic_vector(7 downto 0);
			Yna:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component xnor00 is
		port
		(
			Axn:in std_logic_vector(7 downto 0);
			Bxn:in std_logic_vector(7 downto 0);
			Yxn:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component not00 is
		port
		(
			Anot:in std_logic_vector(7 downto 0);
			Ynot:out std_logic_vector(7 downto 0)
		);
	end component;
	component mux8vhd is
		port(
		Am: in std_logic_vector(7 downto 0);
		Bm: in std_logic_vector(7 downto 0);
		Cm: in std_logic_vector(7 downto 0);
		Dm: in std_logic_vector(7 downto 0);
		Em: in std_logic_vector(7 downto 0);
		Fm: in std_logic_vector(7 downto 0);
		Gm: in std_logic_vector(7 downto 0);
		


		
		sel:in std_logic_vector(2 downto 0);
		
		Ym: out std_logic_vector(7 downto 0)
	);
	
	
	end component;
end package;