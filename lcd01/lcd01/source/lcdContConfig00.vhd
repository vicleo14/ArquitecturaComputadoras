library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packagediv00.all;

entity lcdContConfig00 is
	port(
		clkcc: in std_logic;
		resetcc: in std_logic;
		inFlagcc: in std_logic;
		outcontcc: inout std_logic_vector(5 downto 0);
		outFlagcc:out std_logic
		
	);
end entity;

architecture lcdContConfig0 of lcdContConfig00 is
begin
	pcont: process(clkcc)
	begin
		if(clkcc'event and clkcC='1') then 
			case resetcc is
				when '0'=>
					outcontcc<=(others=>'0');
					outFlagcc<='0';
				when '1'=>
					case inFlagcc is
						when '0'=>
							if(outcontcc<"010011") then
								outcontcc<=outcontcc+'1';
								outFlagcc<='1';
							else
								outcontcc<=outcontcc;
							end if;
						when '1'=>
							outcontcc<=outcontcc;
							outFlagcc<='0';
						when others=>null;
					end case;
				when others=>null;
			end case;
		end if;
	end process pcont;
end architecture;