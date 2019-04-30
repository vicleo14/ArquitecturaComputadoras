library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity contRead00 is
  port(
       clkrd: in std_logic;
	   enrd: in std_logic;
	   rwrd: in std_logic;
	   inDirWrd: in std_logic_vector(4 downto 0);
       outContrd: inout std_logic_vector(4 downto 0));
end contRead00;

architecture contread0 of contread00 is
signal scontr: std_logic_vector(1 downto 0);
begin
scontr<=(enrd)&(rwrd);
	pcontRead: process (clkrd)
	begin
		if(clkrd'event and clkrd='1') then
			case scontr is
				when "00"=>
					outcontrd<=(others=>'0');
				when "01"=>
					outcontrd<=(others=>'0');

				when "10"=>
					outcontrd<=inDirWrd;
				when "11"=>
					if(outcontrd>"00000") then
						outcontrd<=outcontrd-'1';
					else
						outcontrd<=outcontrd;
					end if;
				when others=>null;				
			end case;
		end if;
	end process pcontRead;
end architecture;