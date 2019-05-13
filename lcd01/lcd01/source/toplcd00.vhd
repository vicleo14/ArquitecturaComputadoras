library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

use packagelcd00.all;

entity toplcd00 is
	port(
		clk00: inout std_logic;
		cdiv00: in std_logic_vector(4 downto 0);
		reset0: in std_logic;
		outFlagcc0: inout std_logic;
		outFlagc0: inout std_logic;
		outFlagcd0: inout std_logic;
		outFlagd0: inout std_logic;
		
		outContcc0: inout std_logic_vector(5 downto 0);
		outContcd0: inout std_logic_vector(5 downto 0);
		
		outwordLCD0: out std_logic_vector(7 downto 0);
		outwordLED0: out std_logic_vector(7 downto 0);
		
		outRWled0: out std_logic;
		outRSled0: out std_logic;
		outENled0: out std_logic;
		
		outRW0: out std_logic;--
		outRS0: out std_logic;--
		outEN0: out std_logic;--
		
		ready: out std_logic_vector(1 downto 0)
		
	);
end entity;

architecture toplcd0 of toplcd00 is
signal scommand: std_logic_vector(7 downto 0);
signal sdata: std_logic_vector(7 downto 0);
signal sRWc,sRSc,sENc: std_logic;
signal sRWcd,sRScd,sENcd: std_logic;
signal sword0,sword1,sword2,sword3,swordm:std_logic_vector(7 downto 0);
signal soutRW0,soutRS0,soutEN0: std_logic;
signal sReady1,sReady2,sReady3: std_logic;
signal scont2:std_logic_vector(5 downto 0);
signal scont3:std_logic_vector(2 downto 0);
signal sEN1,sEN2,sEN3,sENp,sOutflaf11: std_logic;
signal sRW1,sRW2,sRW3,sRWp: std_logic;
signal sRS1,sRS2,sRS3,sRSp,sOutFlagd4: std_logic;
begin
	ready<=(sReady1)&(sReady2);
	outWordLCD0<=sword0;
	outWoRdLED0<=sword0;
	
	outRW0<=soutRW0;
	outRWled0<=soutRW0;
	outRS0<=soutRS0;
	outRSled0<=soutRS0;
	outEN0<=soutEN0;
	outENled0<=soutEN0;
	
	LC00: topdiv00 port map
	(
		cdiv0=>cdiv00,
		clk0=>clk00
	);
	LC01: lcdContConfig00 port map(
		clkcc=>clk00,
		resetcc=>reset0,
		inFlagcc=>outFlagcc0,
		outcontcc=>outcontcc0,
		outFlagcc=>outFlagcc0
	);
	LC02: lcdConfig00 port map(
		clkc=>clk00,
		resetc=>reset0,
		inFlagc=>outFlagcc0,
		incontc=>outcontcc0,
		outcommandc=>scommand,
		RWc=>sRWc,
		RSc=>sRSc,
		ENc=>sENc,
		outFlagc=>outFlagc0
	);
	LC03: lcdContData00 port map(
		clkcd=>clk00,
		resetcd=>reset0,
		inFlagcd=>outFlagc0,
		outContcd=>outcontcd0,
		RWcd=>sRW1,
		RScd=>sRS1,
		ENcd=>sEN1,
		outFlagcd=>outFlagcd0,
		outFlagReadycd=>sReady1
	);
	LC04: lcdData00 port map(
			clkd=>clk00,
			resetd=>reset0,
			inFlagd=>outFlagcd0,
			incontd=>outcontcd0,
			outWordd=>sword1
		);
		
	LC09:lsalContData00 port map(
			clksal=>clk00,
			resetsal=>reset0,
			inFlagsal=>sReady1,
			outcontsal=>scont3,
			outFlagsal=>sOutflaf11,
			outFlagReadysal=>sReady2
		);
		LC10: lcdSalto00 port map(
			clkS=>clk00,
			resets=>reset0,
			inFlags=>sOutflaf11,
			inconts=>scont3,
			rws=>sRW2,
			rss=>sRS2,
			ENs=>sEN2,
			outCommands=>sword2
		);
	LC06: lcdContData00 port map(
		clkcd=>clk00,
		resetcd=>reset0,
		inFlagcd=>sReady2,
		outContcd=>scont2,
		RWcd=>sRW3,
		RScd=>sRS3,
		ENcd=>sEN3,
		outFlagcd=>sOutFlagd4,
		outFlagReadycd=>sReady3
	);
	LC07: lcdData01 port map
	(
			clkd=>clk00,
			resetd=>reset0,
			inFlagd=>sOutFlagd4,
			incontd=>scont2,
			outWordd=>sword3
	);
		
		
	LC05: lcdmux00 port map(
		resetm=>reset0,
		inFlagcm=>outFlagc0,
		inCommandm=>scommand,
		inRWcm=>sRWc,
		inRScm=>sRSc,
		inENcm=>sENc,
		inWordm=>swordm,
		inRWdm=>sRWp,
		inRSdm=>sRSp,
		inENdm=>sENp,
		outWordm=>sword0,
		outRWm=>soutRW0,
		outRSm=>soutRS0,
		outENm=>soutEN0
	);
	
	LC08: lcdmux01 port map(
			resetm=>reset0,
			inFlagd1=>sReady1,
			inFlagc2=>sReady2,
			inWordd1=>sword1,
			inCommand2=>sword2,
			inWordd2=>sword3,
			inRWd1=>sRW1,
			inRWc2=>sRW2,
			inRWd2=>sRW3,
			inRSd1=>sRS1,
			inRSc2=>sRS2,
			inRSd2=>sRS3,
			inENd1=>sEN1,
			inENc2=>sEN2,
			inENd2=>sEN3,	
			outWordm1=>swordm,
			outRWm1=>sRWp,
			outRSm1=>sRSp,
			outENm1=>sENp
		);
		
end architecture;