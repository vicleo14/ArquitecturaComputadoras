library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity toprotIzq is
	port(
		clks: in std_logic;
		enables: in std_logic;
		ins:in std_logic_vector(7 downto 0);
		outs:out std_logic_vector(7 downto 0)
	);
end entity;

architecture toprotIzq0 of toprotIzq is
signal sshift:std_logic_vector(7 downto 0);
begin
	pshift: process(clks)
	begin
		if (clks'event and clks='1') then
			case enables is
				when '0'=>
					sshift<=ins;
					outs<=(others=>'0');
				when '1'=>
					sshift(0)<=sshift(7);
					sshift(7 downto 1) <=sshift(6 downto 0);
					outs<=sshift;
				when others=>null;
			end case;
		end if;
	end process pshift;
end architecture;