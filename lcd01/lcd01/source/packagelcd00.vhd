library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;

package packagelcd00 is
	component lcdmux00
			port(
				resetm: in std_logic;
				inFlagcm: in std_logic;
				inCommandm: in std_logic_vector(7 downto 0);
				inRWcm: in std_logic;
				inRScm: in std_logic;
				inENcm: in std_logic;
				inWordm: in std_logic_vector(7 downto 0);
				inRWdm: in std_logic;
				inRSdm: in std_logic;
				inENdm: in std_logic;
				outWordm: out std_logic_vector(7 downto 0);
				outRWm: out std_logic;
				outRSm: out std_logic;
				outENm: out std_logic
			);
	end component;

	component lcdData00
		port(
			clkd: in std_logic;
			resetd: in std_logic;
			inFlagd: in std_logic;
			incontd: in std_logic_vector(5 downto 0);
			outWordd: out std_logic_vector(7 downto 0)
		);
	end component;

	component  lcdContData00
		port(
			clkcd:in std_logic;
			resetcd: in std_logic;
			inFlagcd: in std_logic;
			outcontcd: inout std_logic_vector(5 downto 0);
			outFlagcd: out std_logic;
			outFlagReadycd: out std_logic;
			RWcd: out std_logic;
			RScd: out std_logic;
			ENcd: out std_logic
		);
	end component;

	component lcdConfig00

		port(
			clkc: in std_logic;
			resetc: in std_logic;
			inFlagc: in std_logic;
			incontc: in std_logic_vector(5 downto 0);
			rwc: out std_logic;
			rsc: out std_logic;
			ENc: out std_logic;
			outCommandc: out std_logic_vector(7 downto 0);
			outFlagC: out std_logic
		);
	end component;

	component lcdContConfig00
		port(
			clkcc: in std_logic;
			resetcc: in std_logic;
			inFlagcc: in std_logic;
			outcontcc: inout std_logic_vector(5 downto 0);
			outFlagcc:out std_logic
			
		);
	end component;
	component topdiv00
		port(
			cdiv0:in std_logic_vector(4 downto 0);
			clk0:inout std_logic
		);
	end component;
	component lcdData01
		port(
			clkd: in std_logic;
			resetd: in std_logic;
			inFlagd: in std_logic;
			incontd: in std_logic_vector(5 downto 0);
			outWordd: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component lcdmux01
		port(
			resetm: in std_logic;
			inFlagd1: in std_logic;
			inWordd1: in std_logic_vector(7 downto 0);
			inWordd2: in std_logic_vector(7 downto 0);
			inFlagc2: in std_logic;
			inCommand2: in std_logic_vector(7 downto 0);
			inRWd1: in std_logic;
			inRSd1: in std_logic;
			inENd1: in std_logic;
			inRWd2: in std_logic;
			inRSd2: in std_logic;
			inENd2: in std_logic;
			inRWc2: in std_logic;
			inRSc2: in std_logic;
			inENc2: in std_logic;
			outWordm1: out std_logic_vector(7 downto 0);
			outRWm1: out std_logic;
			outRSm1: out std_logic;
			outENm1: out std_logic
		);
	end component;
	component  lsalContData00
		port(
			clksal:in std_logic;
			resetsal: in std_logic;
			inFlagsal: in std_logic;
			outcontsal: inout std_logic_vector(2 downto 0);
			outFlagsal: out std_logic;
			outFlagReadysal: out std_logic
		);
	end component;
	component lcdSalto00 
		port(
			clkS: in std_logic;
			resets: in std_logic;
			inFlags: in std_logic;
			inconts: in std_logic_vector(2 downto 0);
			rws: out std_logic;
			rss: out std_logic;
			ENs: out std_logic;
			outCommands: out std_logic_vector(7 downto 0)
		);
	end component;
end package;