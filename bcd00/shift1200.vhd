library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity shift1200 is
	port(
		clks12: in std_logic;
		opcodes12: in std_logic_vector(3 downto 0);
		inACs12: in std_logic_vector(11 downto 0);
		inFlags12: in std_logic;
		outACs12: out std_logic_vector(11 downto 0);
		outFlags12: out std_logic
	);
end entity;

architecture shift120 of shift1200 is
begin
	pshift: process(clks12)
	variable aux: bit:='0';
	begin
		if(clks12'event and clks12='1') then
			if(opcodes12="0101")then
				case inFlags12 is
					when '1'=>
						if(aux='0') then
							aux:='1';
							outACs12(0)<='0';
							outAcs12(11 downto 1)<=inACs12(10 downto 0);
							outFlags12<='1';
						else
							outFlags12<='0';
						end if;
					when '0'=>
						outFlags12<='0';
					when others=>null;
				end case;
				else
				aux:='0';
				outACs12<=(others=>'Z');
				outFlags12<='Z';
end if;
		end if;
	end process;
end architecture;