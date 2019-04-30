library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity portData00 is
	port(
		clkpd: in std_logic;
		inFlagpd: in std_logic;
		opcodepd: in std_logic_vector(3 downto 0);
		inpd: in std_logic_vector(7 downto 0);
		outpd: out std_logic_vector(7 downto 0);
		outFlagpd: out std_logic
	);
end entity;

architecture portData0 of portData00 is
begin
	ppd: process(clkpd)
	variable aux: bit :='0';
	begin
		if(clkpd'event and clkpd='1') then
			if(opcodepd="0001") then
				case inFlagpd is
					when '0'=>
						outFlagpd<='0';
					when '1'=>
						if(aux='1') then
							aux:='1';
							outpd<=inpd;
							outFlagpd<='1';
						end if;
					when others=>null;
				end case;
			else
				aux:='0';
				outFlagpd<='Z';
				outpd<=(others=>'Z');
			end if;
		end if;
	end process ppd;
end architecture;