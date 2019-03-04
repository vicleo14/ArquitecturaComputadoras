library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
use packagediv00.all;
use packageshiftRL00.all;
entity topshiftRL00 is
	port(
		clk00:inout std_logic;
		cdiv00: in std_logic_vector(4 downto 0);
		en0: in std_logic;
		ins0: in std_logic_vector(7 downto 0);
		barrelP:in std_logic_vector(3 downto 0);
		outs0:out std_logic_vector(7 downto 0);
		sel: in std_logic_vector(2 downto 0)
	);
end entity;

architecture topshiftRL0 of topshiftRL00 is
signal shiftRL,shiftRD,rotIz,rotDer,barIzq,barDer,barrIzq,barrDer: std_logic_vector(7 downto 0);
begin
	SRL00:topdiv00 port map
	(
		clk0=>clk00,
		cdiv0=>cdiv00
	);
	
	SRL01:shiftRL00 port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		outs=>shiftRL
	);
	SRL02:shiftRD00 port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		outs=>shiftRD
	);
	SRL03:toprotIzq port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		outs=>rotIz
	);
	SRL04:toprotDer00 port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		outs=>rotDer
	);
	SRL05:barrelIzq port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		barrel=> barrelP,
		outs=>barIzq
	);
	SRL06:barrelDer port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		barrel=> barrelP,
		outs=>barDer
	);
	SRL07:barrelrIzq port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		barrel=> barrelP,
		outs=>barrIzq
	);
	SRL08:barrelrDer port map
	(
		clks=>clk00,
		enables=>en0,
		ins=>ins0,
		barrel=> barrelP,
		outs=>barrDer
	);

	with sel select
		outs0<= shiftRL when "000",
				shiftRD when "001",
				rotIz when "010",
				rotDer when "011",
				barIzq when "100",
				barDer when "101",
				barrIzq when "110",
				barrDer when "111",
				"00000000" when others;
end architecture;