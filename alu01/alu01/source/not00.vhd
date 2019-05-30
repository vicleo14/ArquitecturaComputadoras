library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity not00 is
	port
	(
		Anot:in std_logic_vector(7 downto 0);
		Ynot:out std_logic_vector(7 downto 0)
	);
end entity;

architecture not0 of not00 is
begin
	Ynot<=not Anot;
end architecture;