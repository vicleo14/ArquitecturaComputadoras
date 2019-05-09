library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contWrite00 is
  port(
       clkrd: in std_logic;
	   enrd: in std_logic;
	   inFlag: in std_logic;
	   rwrd: in std_logic;
       outContW: inout std_logic_vector(4 downto 0);
	   outFlagCont: out std_logic
	   );
end contWrite00;

architecture contWrite0 of contWrite00 is
signal scontr: std_logic_vector(1 downto 0);
begin
scontr<=(enrd)&(rwrd);
	pcontWrite: process (clkrd)
	begin
		if(clkrd'event and clkrd='1') then
			case scontr is
				when "00"=>
					outContW<=(others=>'0');
				when "01"=>
					outContW<=(others=>'0');

				when "10"=>
				--write
					if (inFlag='1' and outContW<"11111") then
						outContW<=outContW+'1';
						outFlagCont<='1';
					else
						outFlagCont<='0';
					end if;
				when "11"=>
				--read
					if(outContW>"00000") then
						outContW<=outContW-'1';
					end if;
				when others=>null;				
			end case;
		end if;
	end process pcontWrite;
end architecture;