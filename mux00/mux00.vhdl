library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity mux00 is
	port(
		Am: in std_logic_vector(2 downto 0);
		Bm: in std_logic_vector(2 downto 0);
		Cm: in std_logic_vector(2 downto 0);
		sel:in std_logic_vector(1 downto 0);
		Ym: out std_logic_vector(2 downto 0)
	);
end entity;

architecture implementacion of mux00 is
begin
	with sel select
		Ym<=Am when "01",
			Bm when "10",
			Cm when "11",
			"000" when others;
		
end architecture;