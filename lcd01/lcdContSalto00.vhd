library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
--32 datos en los nombres
entity  lsalContData00 is
	port(
		clksal:in std_logic;
		resetsal: in std_logic;
		inFlagsal: in std_logic;
		outcontsal: inout std_logic_vector(2 downto 0);
		outFlagsal: out std_logic;
		outFlagReadysal: out std_logic
	);
end entity;

architecture lsalContData0 of lsalContData00 is
signal scontrol: std_logic_vector(1 downto 0);
begin
	scontrol<=(resetsal)&(inFlagsal);
	psal: process(clksal)
	variable aux: bit:='0';
	begin
		if(clksal'event and clksal='1') then
			case scontrol is
				when "10"=>
					outcontsal<=(others=>'0');
					outflagsal<='0';
					outFlagReadysal<='0';
				when "11"=>
					if((outcontsal<"101")) then
						outFlagReadysal<='0';
						 if(aux='0')then
							aux:='1';
							outcontsal<=outcontsal;
							outFlagsal<='1';
						elsif (aux='1') then
							aux:='0';
							outcontsal<=outcontsal+'1';
							outFlagsal<='0';
						end if;
					else
						outFlagReadysal<='1';
					end if;
				when others=>null;
			end case;
		end if;
	end process;
end architecture;