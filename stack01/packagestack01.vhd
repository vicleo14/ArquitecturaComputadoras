library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagestack01 is

	component topdiv00 
		port(
			cdiv0:in std_logic_vector(4 downto 0);
			clk0:inout std_logic
		);
	end component;
	component contRead00 
	  port(
		   clkrd: in std_logic;
		   enrd: in std_logic;
		   rwrd: in std_logic;
		   inDirWrd: in std_logic_vector(4 downto 0);
		   outContrd: inout std_logic_vector(4 downto 0));
	end component;
	component mux00 
		port(
			enm: in std_logic;
			rwm: in std_logic;
			inwordKm: in std_logic_vector(7 downto 0);
			inwordRamm: in std_logic_vector(7 downto 0);
			outWordm: out std_logic_vector(7 downto 0)
		);
	end component;
	component stack01
		  port(
			   clkst: in std_logic;
			   enst: in std_logic;
			   rwst: in std_logic;
			   inFlagst: in std_logic;
			   indirWst: inout std_logic_vector(4 downto 0);
			   indirRst: in std_logic_vector(4 downto 0);
			   inwordWst: in std_logic_vector(7 downto 0);
			   outwordSt: out std_logic_vector(7 downto 0));
		end component;


	component coder00 
	  port(
		   clkc: in std_logic;
		   enc: in std_logic;
		   rwc: in std_logic;
		   inkeyc: in std_logic_vector(3 downto 0);
		   incontc: in std_logic_vector(4 downto 0);
		   outFlagc: out std_logic;
		   outcoderc: out std_logic_vector(7 downto 0));
	end component;


	component contring00 
		port(
			enr: in std_logic;
			clkr: in std_logic;
			outr: out std_logic_vector(4 downto 0)
		);
	end component;
	component contWrite00
	  port(
		   clkrd: in std_logic;
		   enrd: in std_logic;
		   inFlag: in std_logic;
		   rwrd: in std_logic;
		   outContW: inout std_logic_vector(4 downto 0));
	end component;
end package;