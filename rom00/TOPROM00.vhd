library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;use packagerom00.all;

entity toprom00 is
	port(
		clk00: inout std_logic;
		cdiv00: in std_logic_vector(4 downto 0);
		en0:in std_logic;
		outcont0: inout std_logic_vector(3 downto 0);
		outword0: out std_logic_vector(6 downto 0);
		outtransist0: out std_logic_vector(5 downto 0)
	);
end entity;

architecture toprom0 of toprom00 is
begin
	RO00: topdiv00 port map(
		clk0=>clk00,
		cdiv0=>cdiv00
	);
	RO01: contRead00 port map(
		clkrd=> clk00,
		enrd=>en0,
		outcontrd=>outcont0
	);
	RO02: rom00 port map(
		clkro=>clk00,
		enro=>en0,
		indirro=>outcont0,
		outwordro=>outword0
	);
	outtransist0<="111110";
end architecture;