library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;

entity lcdmux00 is
	port(
		resetm: in std_logic;
		inFlagcm: in std_logic;
		inCommandm: in std_logic_vector(7 downto 0);
		inRWcm: in std_logic;
		inRScm: in std_logic;
		inENcm: in std_logic;
		inWordm: in std_logic_vector(7 downto 0);
		inRWdm: in std_logic;
		inRSdm: in std_logic;
		inENdm: in std_logic;
		outWordm: out std_logic_vector(7 downto 0);
		outRWm: out std_logic;
		outRSm: out std_logic;
		outENm: out std_logic
	);
end entity;

architecture lcdmux0 of lcdmux00 is
signal scontrol: std_logic_vector(1 downto 0);
begin
scontrol<=(resetm)&(inFlagcm);
	with scontrol select
		outWordm<=inCommandm when "10",
				inWordm when "11",
				"00000000" when others;
				
	with scontrol select
		outRWm<=inRWcm when "10",
				inRWdm when "11",
				'0' when others;
				
	with scontrol select
		outRSm<=inRScm when "10",
				inRSdm when "11",
				'0' when others;
				
	with scontrol select
		outENm<=inENcm when "10",
				inENdm when "11",
				'0' when others;
				
				
end architecture;