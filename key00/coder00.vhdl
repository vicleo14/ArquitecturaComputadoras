library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(3 downto 0);
		outcoderc: out std_logic_vector(6 downto 0)
		
	);
end entity;

architecture coder0 of coder00 is
begin
	pcoder: process(clkc)
	begin
		if(clkc'event and clk='1') then
			case incontc is
				when "1000"=>
					case inkeyc is
						when "0000"=>
						
						when "0001"=>
						
						when "0010"=>
						
						when "0100"=>
						
						when "1000"=>
						when others=>null;
					end case;
				when "0100"=>
				
				when "0010"=>
				
				when "0001"=>
				
				when others=>null;
			end case;
		end if;
	end process;


end architecture;