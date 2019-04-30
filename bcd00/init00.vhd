library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;
entity init00 is
	port(
		clkinit: in std_logic;
		opcodeinit: in std_logic_vector(3 downto 0);
		inFlaginit: in std_logic;
		outAC8init: out std_logic_vector(7 downto 0);
		outAC12init: out std_logic_vector(11 downto 0);
		outFlag8init: out std_logic;
		outFlag12init: out std_logic
	);
end entity;

architecture init0 of init00 is
begin
	pinit: process(clkinit)
	variable aux0: bit:='0';
	variable aux1: bit:='0';
	begin
		if(clkinit'event and clkinit='1') then
			if(opcodeinit="0000") then
				case inFlaginit is
					when '0'=>
						case aux0 is
							when '0'=>
								aux0:='1';
								outFlag8init<='1';
								outFlag12init<='1';
								outAC8init<="00111100";
								outAC12init<="000011110000";
							when '1'=>
								outFlag8init<='0';
								outFlag12init<='0';
							when others=>null;
						end case;
					when '1'=>
						case aux1 is
							when '0'=>
								aux1:='1';
								outFlag8init<='1';
								outFlag12init<='1';
								outAC8init<="11000011";
								outAC12init<="111100001111";
							when '1'=>
								outFlag8init<='0';
								outFlag12init<='0';
							when others=>null;
						end case;
					when others=>null;
				end case;
			else
				aux0:='0';
				aux1:='0';
				outFlag8init<='Z';
				outFlag12init<='Z';
				outAC8init<=(others=>'Z');
				outAC12init<=(others=>'Z');
			end if;
		end if;
	end process pinit;
end architecture;