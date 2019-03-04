library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnor00 is
	port
	(
		Axn:in std_logic_vector(7 downto 0);
		Bxn:in std_logic_vector(7 downto 0);
		Yxn:out std_logic_vector(7 downto 0)
	);
end entity;

architecture xnor0 of xnor00 is
begin
	Yxn<=Axn xnor Bxn;
end architecture;