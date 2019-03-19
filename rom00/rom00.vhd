library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity rom00 is
	port(
		clkro: in std_logic;
		enro: in std_logic;
		indirro: in std_logic_vector(3 downto 0);
		outwordro: out std_logic_vector(6 downto 0)
	);
end entity;

architecture rom0 of rom00 is

type arrayrom is array(0 to 31) of std_logic_vector(6 downto 0);
constant wordrom: arrayrom:=("0001000",--A
							"0000001",--0
							"1001111",--1
							"0010010",--2
							"0000110",--3
							"1001011",--4
							"0100100",--5
							"0000100",--9
							"0000000",--8
							"0001111",--7
							"0100000",--6
							"0100100",--5
							others=>"1111111");

begin
	prom: process(clkro)
	begin
		if(clkro'event and clkro='1') then
			case enro is
				when '0'=>
					outwordro<="1111111";
				when '1'=>
					outwordro<=wordrom(conv_integer(indirro));
				when others=>null;
			end case;
		end if;
	end process;
end architecture;