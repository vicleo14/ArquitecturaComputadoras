library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity mux8vhd is
	port(
		Am: in std_logic_vector(7 downto 0);
		Bm: in std_logic_vector(7 downto 0);
		Cm: in std_logic_vector(7 downto 0);
		Dm: in std_logic_vector(7 downto 0);
		Em: in std_logic_vector(7 downto 0);
		Fm: in std_logic_vector(7 downto 0);
		Gm: in std_logic_vector(7 downto 0);
		


		
		sel:in std_logic_vector(2 downto 0);
		
		Ym: out std_logic_vector(7 downto 0)
	);
end entity;

architecture implementacion of mux8vhd is
begin
	with sel select
		Ym<=Am when "001",
			Bm when "010",
			Cm when "011",
			Dm when "100",
			Em when "101",
			Fm when "110",
			Gm when "111",
			"00000000" when others;
		
end architecture;