library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xor00 is
	port
	(
		Axo:in std_logic_vector(7 downto 0);
		Bxo:in std_logic_vector(7 downto 0);
		Yxo:out std_logic_vector(7 downto 0)
	);
end entity;

architecture xor0 of xor00 is
begin
	Yxo<=Axo xor Bxo;
end architecture;