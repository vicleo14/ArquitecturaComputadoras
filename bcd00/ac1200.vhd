library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
entity ac1200 is
	port(
		clkac12: in std_logic;
		inAC12: in std_logic_vector(11 downto 0);
		inFlagac12: in std_logic;
		outAC12: out std_logic_vector(11 downto 0);
		outFlagAC12: out std_logic
	);
end entity;
architecture ac120 of ac1200 is
begin
	pac12: process(clkac12)
	variable aux: bit:='0';
	begin
		if(clkac12'event and clkac12='1') then
		case inFlagac12 is
			when '1'=>
			if(aux='0') then
				aux:='1';
				outAC12<=inAC12;
				outFlagAC12<='1';
			else
				outFlagAC12<='0';
			end if;
			when '0'=>
				outFlagAC12<='0';
				aux:='0';
			when others=>null;
		end case;
		end if;
	end process pac12;
end architecture;