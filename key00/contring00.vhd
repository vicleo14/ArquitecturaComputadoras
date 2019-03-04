library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity contring00 is
	port(
		enr: in std_logic;
		clkr: in std_logic;
		outr: out std_logic_vector(3 downto 0)
	);
end entity;

architecture contring0 of contring00 is
signal scont:std_logic_vector(3 downto 0);
begin
	pring: process(clkr)
	begin
		case enr is
			when '0' =>
				outr<=(others=>'0');
				scont<= "0001";
			when '1'=>
				scont(3)<=scont(0);
				scont(2 downto 0)<=Scont(3 downto 1);
				outr<=scont;
			
			when others =>null;
		end case;
	end process pring;
end architecture;