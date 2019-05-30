library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity or00 is
	port
	(
		Ao:in std_logic_vector(7 downto 0);
		Bo:in std_logic_vector(7 downto 0);
		Yo:out std_logic_vector(7 downto 0)
	);
end entity;

architecture or0 of or00 is
begin
	Yo<=Ao or Bo;
end architecture;