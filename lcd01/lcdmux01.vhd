library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;

entity lcdmux01 is
	port(
		resetm: in std_logic;
		inFlagd1: in std_logic;
		inWordd1: in std_logic_vector(7 downto 0);
		inWordd2: in std_logic_vector(7 downto 0);
		inFlagc2: in std_logic;
		inCommand2: in std_logic_vector(7 downto 0);
		inRWd1: in std_logic;
		inRSd1: in std_logic;
		inENd1: in std_logic;
		inRWd2: in std_logic;
		inRSd2: in std_logic;
		inENd2: in std_logic;
		inRWc2: in std_logic;
		inRSc2: in std_logic;
		inENc2: in std_logic;
		outWordm1: out std_logic_vector(7 downto 0);
		outRWm1: out std_logic;
		outRSm1: out std_logic;
		outENm1: out std_logic
	);
end entity;

architecture lcdmux1 of lcdmux01 is
signal scontrol: std_logic_vector(1 downto 0);
begin
	scontrol<=(inFlagd1)&(inFlagc2);
		with scontrol select
		outWordm1<=inWordd1 when "00",
				inCommand2 when "10",
				inWordd2 when "11",
				"00000000" when others;
	with scontrol select
		outRWm1<=inRWd1 when "00",
				inRWc2 when "10",
				inRWd2 when "11",
				'0' when others;
				
	with scontrol select
		outRSm1<=inRsd1 when "00",
				inRsc2 when "10",
				inRsd2 when "11",
				'0' when others;
	with scontrol select
		outENm1<=inENd1 when "00",
				inENc2 when "10",
				inENd2 when "11",
				'0' when others;
	
				
end architecture;