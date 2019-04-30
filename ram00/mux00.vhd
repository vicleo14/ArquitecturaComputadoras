library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity mux00 is
	port(
		enm: in std_logic;
		rwm: in std_logic;
		inwordKm: in std_logic_vector(6 downto 0);
		inwordRamm: in std_logic_vector(6 downto 0);
		outWordm: out std_logic_vector(6 downto 0)
	);
end entity;
architecture mux0 of mux00 is
signal scontr:std_logic_vector(1 downto 0);
begin
	scontr<=(enm)& (rwm);
	with scontr select
		outWordm<=inwordKm when "10",
					inwordRamm when "11",
					"1111111" when others; 
end architecture;