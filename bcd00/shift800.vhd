library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity shift800 is
	port(
		clks8: in std_logic;
		opcodes8: in std_logic_vector(3 downto 0);
		inACs8: in std_logic_vector(7 downto 0);
		inFlags8: in std_logic;
		outACs8: out std_logic_vector(7 downto 0);
		outFlags8: out std_logic
	);
end entity;

architecture shift80 of shift800 is
begin
	pshift: process(clks8)
	variable aux: bit:='0';
	begin
		if(clks8'event and clks8='1') then
			if(opcodes8="0100")then
				case inFlags8 is
					when '1'=>
						if(aux='0') then
							aux:='1';
							outACs8(0)<='0';
							outAcs8(7 downto 1)<=inACs8(6 downto 0);
							outFlags8<='1';
						else
							outFlags8<='0';
						end if;
					when '0'=>
						outFlags8<='0';
					when others=>null;
				end case;
				else
				aux:='0';
				outACs8<=(others=>'Z');
				outFlags8<='Z';
end if;
		end if;
	end process;
end architecture;