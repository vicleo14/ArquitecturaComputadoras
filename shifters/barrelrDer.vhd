library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity barrelrDer is
	port(
		clks: in std_logic;
		enables: in std_logic;
		barrel: in std_logic_vector(3 downto 0);
		ins:in std_logic_vector(7 downto 0);
		outs:out std_logic_vector(7 downto 0)
	);
end entity;

architecture barrelrDer0 of barrelrDer is
signal sshift:std_logic_vector(7 downto 0);
signal contador:std_logic_vector(3 downto 0);
begin
	pshift: process(clks)
	begin
		if (clks'event and clks='1') then
			case enables is
				when '0'=>
					sshift<=ins;
					outs<=(others=>'0');
					contador<=(others=>'0');
				when '1'=>
					if (contador<barrel+1) then
						contador<=contador+'1';
					sshift(7)<=sshift(0);
					sshift(6 downto 0) <=sshift(7 downto 1);
					outs<=sshift;
				else
					contador<=contador;
				end if;
				when others=>null;
			end case;
		end if;
	end process pshift;
end architecture;