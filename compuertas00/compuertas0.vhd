library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagecompuertas00.all;

entity compuertas00 is
	port
	(
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		selP:in std_logic_vector(2 downto 0);
		
		Y: out std_logic_vector(7 downto 0)
	);
end entity;

architecture compuertas0 of compuertas00 is
signal Ya0,Yo0,Yxo0,Yno0,Yna0,Yxn0,Ynot0:std_logic_vector(7 downto 0);
begin
	CO00: and00 port map
	(
		Aa=>A,
		Ba=>B,
		Ya=>Ya0
	);
	CO01: or00 port map
	(
		Ao=>A,
		Bo=>B,
		Yo=>Yo0
	);
	CO02: xor00 port map
	(
		Axo=>A,
		Bxo=>B,
		Yxo=>Yxo0
	);
	CO03: nor00 port map
	(
		Ano=>A,
		Bno=>B,
		Yno=>Yno0
	);
	CO04: nand00 port map
	(
		Ana=>A,
		Bna=>B,
		Yna=>Yna0
	);
	CO05: xnor00 port map
	(
		Axn=>A,
		Bxn=>B,
		Yxn=>Yxn0
	);
	CO06: not00 port map
	(
		Anot=>A,
		Ynot=>Ynot0
	);
	CO07: mux8vhd port map
	(
		Am=>Ya0,--1
		Bm=>Yo0,--2
		Cm=>Yxo0,--3
		Dm=>Yno0,--4
		Em=>Yna0,--5
		Fm=>Yxn0,--5
		Gm=>Ynot0,--7
		Ym=>Y,
		sel=>selP

	);
end architecture;