library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nor00 is
	port
	(
		Ano:in std_logic_vector(7 downto 0);
		Bno:in std_logic_vector(7 downto 0);
		Yno:out std_logic_vector(7 downto 0)
	);
end entity;

architecture nor0 of nor00 is
begin
	Yno<=Ano nor Bno;
end architecture;