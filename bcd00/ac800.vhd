library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
entity ac800 is
	port(
		clkac8: in std_logic;
		inAC8: in std_logic_vector(7 downto 0);
		inFlagac8: in std_logic;
		outAC8: out std_logic_vector(7 downto 0);
		outFlagAC8: out std_logic
	);
end entity;
architecture ac80 of ac800 is
begin
	pac8: process(clkac8)
	variable aux: bit:='0';
	begin
		if(clkac8'event and clkac8='1') then
		case inFlagac8 is
			when '1'=>
			if(aux='0') then
				aux:='1';
				outAC8<=inAC8;
				outFlagAC8<='1';
			else
				outFlagAC8<='0';
			end if;
			when '0'=>
				outFlagAC8<='0';
				aux:='0';
			when others=>null;
		end case;
		end if;
	end process pac8;
end architecture;