library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(3 downto 0);
		outcoderc: out std_logic_vector(7 downto 0)
		
	);
end entity;

architecture coder0 of coder00 is
begin
	pcoder: process(clkc)
	variable aux: bit:='0';
	begin
		if(clkc'event and clkc='1') then
			case incontc is
				when "1000"=>
					case inkeyc is
						when "0000"=>
							aux:='0';
							outcoderc<="11111111";
						when "0001"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="10011111";--1
							end if;
						
						when "0010"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00100101";--2
							end if;
						
						when "0100"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00001101";--3
							end if;
						
						when "1000"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00010001";--A
							end if;
						when others=>null;
					end case;
					
					
				when "0100"=>
					case inkeyc is
						when "0000"=>
							aux:='0';
						when "0001"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="10011001";--4
							end if;
						
						when "0010"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="01001001";--5
							end if;
						
						when "0100"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="01000001";--6
							end if;
						
						when "1000"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="11000001";--b
							end if;
						when others=>null;
					end case;
					
					
					
				
				when "0010"=>
				
				
					case inkeyc is
						when "0000"=>
							aux:='0';
						when "0001"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00011111";--7
							end if;
						
						when "0010"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00000001";--8
							end if;
						
						when "0100"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00011001";--9
							end if;
						
						when "1000"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="01100011";--C
							end if;
						when others=>null;
					end case;
				
				when "0001"=>
					case inkeyc is
						when "0000"=>
							aux:='0';
						when "0001"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00000011";--0
							end if;
						
						when "0010"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00111001";-- * -->Cuadro arriba
							end if;
						
						when "0100"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="11000101";--* -->Cuadro abajo
							end if;
						
						when "1000"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="11111101";--  menos
							end if;
						when others=>null;
					end case;
				when others=>null;
			end case;
		end if;
	end process;


end architecture;