library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagediv00.all;

entity topdiv00 is
	port(
		clk0:inout std_logic
	);
end entity;
architecture topdiv0 of topdiv00 is
signal sclk:std_logic;
begin
	OS00: osc00 port map(osc_int=>sclk);
	OS01: div00 port map(
		clkdiv=>sclk,
		outdiv=>clk0
		);
end architecture;