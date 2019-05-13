library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;

entity lcdData00 is
	port(
		clkd: in std_logic;
		resetd: in std_logic;
		inFlagd: in std_logic;
		incontd: in std_logic_vector(5 downto 0);
		outWordd: out std_logic_vector(7 downto 0)
	);
end entity;

architecture lcdData0 of lcdData00 is
type arraydata is array(0 to 63) of std_logic_vector(7 downto 0);
constant worddata: arraydata:=("01010110",--V
								"01001001",--I
								"01000011",--C
								"01010100",--T
								"01001111",--O
								"01010010",--R
								"00100000",--ESPACIO
								"01001101",--M
								"01001111",--O
								"01010010",--R
								"01000001",--A
								"01001100",--L
								"01000101",--E
								"01010011",--S
								--"00100000",--ESPACIO
								--"01010110",--V
								--"01000001",--A
								--"01001110",--N
								--"01000101",--E
								--"01010011",--S
								--"01010011",--S
								--"01000001",--A
								--"00100000",--ESPACIO
								--"01010010",--R
								--"01001111",--O
								--"01000100",--D
								--"01010010",--R
								--"01001001",--I
								--"01000111",--G
								--"01010101",--U
								--"01000101",--E
								--"01011010",--Z
								OTHERS=>"00100000"									
								);
begin
	process(clkd)
	
	begin
		if(clkd'event and clkd='1') then
			if(resetd='1') then
				case inFlagd is
					when '0'=>
						outWordd<="00000000";
					when '1'=>
						outWordd<=worddata(conv_integer(incontd));
					when others=>null;
					
				end case;
			end if;
		end if;
	end process;
end architecture;