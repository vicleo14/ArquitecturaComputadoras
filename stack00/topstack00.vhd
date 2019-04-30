library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagestack00.all;

entity topstack00 is
	port(
		clk00: inout std_logic;
		cdiv00: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		rw0: in std_logic;
		inkey0: in std_logic_vector(3 downto 0);
		outFlag0:inout std_logic;
		outr0:out  std_logic_vector(3 downto 0);
		outrLED0:out  std_logic_vector(4 downto 0);
		outcontW0: inout std_logic_vector(4 downto 0);
		outcontR0: inout std_logic_vector(4 downto 0);
		outWord0: out std_logic_vector(7 downto 0);
		outtransist0: out std_logic_vector(5 downto 0)
	);
end entity;

architecture topstack0 of topstack00 is
signal soutr: std_logic_vector(4 downto 0);
signal swordW: std_logic_vector(7 downto 0);
signal swordR: std_logic_vector(7 downto 0);
begin

	outr0<=soutr(3 downto 0);
	outrLED0<=soutr;
	outtransist0<="111110";
	ST00: topdiv00 port map
	(
		clk0=>clk00,
		cdiv0=>cdiv00
	);
	
	ST01: contring00 port map
	(
		clkr=>clk00,
		enr=>en0,
		outr=>soutr
	);
	
	ST02: coder00 port map
	(
		clkc=>clk00,
		enc=>en0,
		rwc=>rw0,
		inkeyc=>inkey0,
		incontc=>soutr,
		outFlagc=>outFlag0,
		outcontc=>outcontW0,
		outcoderc=>swordW
	);
	
	ST03: stack00 port map
	(
		clkst=>clk00,
		enst=>en0,
		rwst=>rw0,
		inFlagst=>outFlag0,
		indirWst=>outcontW0,
		indirRst=>outcontR0,
		inwordWst=>swordW,
		outWordst=>swordR
	);
	
	ST04: mux00 port map
	(
		enm=>en0,
		rwm=>rw0,
		inwordKm=>swordW,
		inwordRamm=>swordR,
		outWordm=>outWord0
	);
	
	ST05: contRead00 port map
	(
		clkrd=>clk00,
		enrd=>en0,
		rwrd=>rw0,
		inDirWrd=>outcontW0,
		outContRd=>outcontr0
	);

end architecture;