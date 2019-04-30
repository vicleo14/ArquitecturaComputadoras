library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packageram00 is
	component contread00
		port
		(
			clkrd: in std_logic;
			enrd:in std_logic;
			rwrd: in std_logic;
			inDirWrd: in std_logic_vector(4 downto 0);
			outContrd: inout std_logic_vector(4 downto 0)
		);
	end component;

	component mux00 
		port(
			enm: in std_logic;
			rwm: in std_logic;
			inwordKm: in std_logic_vector(6 downto 0);
			inwordRamm: in std_logic_vector(6 downto 0);
			outWordm: out std_logic_vector(6 downto 0)
		);
	end component;
	component ram00
		port(
			clkra: in std_logic;
			enra: in std_logic;
			rwra: in std_logic;
			inFlagra: in std_logic;
			indirWra: in std_logic_vector(4 downto 0);
			indirRra: in std_logic_vector(4 downto 0);
			inwordwRA: in std_logic_vector(6 downto 0);
			outWordra:out std_logic_vector(6 downto 0)
		);
	end component;	

	component coder00
		port(
			clkc: in std_logic;
			inkeyc: in std_logic_vector(3 downto 0);
			incontc: in std_logic_vector(3 downto 0);
			outFlagc:out std_logic;
			outcoderc: inout std_logic_vector(7 downto 0);
			outcontc:inout std_logic_vector(3 downto 0)
			
		);
	end component;

	component contring00 
		port(
			enr: in std_logic;
			clkr: in std_logic;
			outr: out std_logic_vector(3 downto 0)
		);
	end component;
		
	component topdiv00 
		port(
			cdiv0:in std_logic_vector(4 downto 0);
			clk0:inout std_logic
		);
	end component;
	
end package;