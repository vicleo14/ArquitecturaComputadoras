library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity sust00 is
	port(
		clksu:in std_logic;
		opcodsu:in std_logic_vector(3 downto 0);
		inFlagsu: in std_logic;
		inAC8su:in std_logic_vector(7 downto 0);
		inAC12su:in std_logic_vector(11 downto 0);
		outAC12su:out std_logic_vector(11 downto 0);
		outAC12ledsu:out std_logic_vector(11 downto 0);
		outFlagAC12: out std_logic;
		outFlagItersu: out std_logic
	);
end entity;
architecture sust0 of sust00 is
begin
	psust: process(clksu)
	variable aux: bit :='0';
	begin
		if(clksu'event and clksu='1') then
			if(opcodsu="0010") then
				case inFlagsu is
					when '0'=>
						outAC12su<=(others=>'0');
						outAC12ledsu<=(others=>'0');
						outFlagAC12<='0';
						outFlagItersu<='0';
					when '1'=>
						if(aux='0') then
						aux:='1';
							outAC12su<=inAC12su(11 downto 1)&inAC8su(7);
							outAC12ledsu<=inAC12su(11 downto 1)&inAC8su(7);
							outFlagAC12<='1';
							outFlagItersu<='1';
						end if;
					when others=>null;
				end case;
			else
				outAC12su<=(others=>'Z');
				outAC12ledsu<=(others=>'Z');
				outFlagAC12<='Z';
				outFlagItersu<='Z';
				aux:='0';
			end if;
		end if;
	end process psust;
end architecture;