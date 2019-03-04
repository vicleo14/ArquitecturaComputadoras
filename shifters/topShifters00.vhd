library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

use packagetopShifters00.all;

entity topShifters00 is
	port(
		clks: in std_logic;
		enables: in std_logic;
		ins:in std_logic_vector(7 downto 0);
		outs:out std_logic_vector(7 downto 0);
		sel: in std_logic_vector(2 downto 0)
	);
end entity;

architecture topShifters0 of topShifters00 is
signal sshift:std_logic_vector(7 downto 0);
signal shiftRL,shiftRD,rotIzq,rotDer:std_logic_vector(7 downto 0);
begin
	
	with sel select
		outs<= shiftRL when "000",
				shiftRD when "001",
				rotIzq when "010",
				rotIzq when "011",
				"00000000" when others;
end architecture;