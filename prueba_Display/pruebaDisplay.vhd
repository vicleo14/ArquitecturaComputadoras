library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity pruebaDisplay is
	port
	(
		A: out std_logic;
		B: out std_logic;
		C: out std_logic;
		D: out std_logic;
		E: out std_logic;
		F: out std_logic;
		G: out std_logic;
		P: out std_logic
	);
end entity;
architecture pD of pruebaDisplay isbegin
	A<='0';
	B<='0';
	C<='0';
	D<='0';
	E<='0';
	F<='0';
	G<='0';
	P<='1';
end architecture;
