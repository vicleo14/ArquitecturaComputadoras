library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;


entity div00 is
	port
	(
		clkdiv:in std_logic;
		outdiv:inout std_logic
	);
end entity;

architecture div0 of div00 is
--signal sclk:std_logic;
signal sdiv:std_logic_vector(20 downto 0);
begin
	pdiv: process(clkdiv)
	begin
		if(clkdiv'event and clkdiv='1') then
					if(sdiv>"100000000000000000000") then 
						sdiv<=(others=>'0');
						outdiv<=not(outdiv);
					else
						sdiv<= sdiv+'1';
						outdiv<=outdiv;
					end if;
		end if;
	end process pdiv;
 
end architecture;