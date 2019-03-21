library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagetopkey00.all;

entity topkey00 is
	port
	(
		inkey0: in std_logic_vector(3 downto 0);
		cdiv: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		outr0:inout std_logic_vector(3 downto 0);
		outrled0:inout std_logic_vector(3 downto 0);
		clk00:inout std_logic;
		outcoder0: inout std_logic_vector(7 downto 0);
		disp: out std_logic_vector(5 downto 0)
	);
end entity;

architecture topkey0 of topkey00 is
signal sring:std_logic_vector(3 downto 0);
	
begin
	outr0<=sring;
	outrled0<=sring;
	disp<="111110";
	KE00:topdiv00 port map(
		cdiv0=>cdiv,
		clk0=>clk00
	);
	
	KE01:contring00 port map(
		enr=>en0,
		clkr=>clk00,
		outr=>sring
	);
	
	KE02:coder00 port map(
		clkc=>clk00,
		inkeyc=>inkey0,
		incontc=>sring,
		outcoderc=>outcoder0
	);
end architecture;