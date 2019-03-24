library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(4 downto 0);
		outcoderc: inout std_logic_vector(7 downto 0)
		
	);
end entity;

architecture coder0 of coder00 is
signal auxk:std_logic_vector(3 downto 0);
begin
	
	
	pcoder: process(clkc)
	variable aux,aux1,aux2,aux3,aux4: bit:='0';
	variable vout:std_logic_vector(7 downto 0);
	begin
		if(clkc'event and clkc='1') then
					
				case incontc is
					when "01000"=>
						case inkeyc is
							when "0000"=>
								if(aux='0' and aux2='0' and aux3='0' and aux4='0') then
									aux:='0';
									aux1:='0';
									outcoderc<="11111111";
								else 
									outcoderc<=vout;
								end if;
								
							when "0001"=>
								if(aux='0'  and aux2='0' and aux3='0' and aux4='0') then
									outcoderc<="10011111";--1
									vout:="10011111";
									aux1:='1';
								else
									outcoderc<=vout;
									
								end if;
							
							when "0010"=>
								if(aux='0' and  aux2='0' and aux3='0' and aux4='0') then
									aux1:='1';
									outcoderc<="00100101";--2
									vout:="00100101";
								else
									outcoderc<=vout;
									
								end if;
							
							when "0100"=>
								if(aux='0'  and aux2='0' and aux3='0' and aux4='0') then
									aux1:='1';
									outcoderc<="00001101";--3
									vout:="00001101";
								else
									outcoderc<=vout;
									
								end if;
							
							when "1000"=>
								if(aux='0'  and aux2='0' and aux3='0' and aux4='0') then
									aux1:='1';
									outcoderc<="00010001";--A
									vout:="00010001";
								else
									outcoderc<=vout;
									
								end if;
							when others=>
								null;
						end case;
						
						
					when "00100"=>
						case inkeyc is
							when "0000"=>
							if(aux='0' and aux1='0' and aux3='0' and aux4='0') then
									aux:='0';
									aux2:='0';
									outcoderc<="11111111";
								else 
									outcoderc<=vout;
								end if;
								
							when "0001"=>
								if(aux='0' and aux1='0' and  aux3='0' and aux4='0') then
									aux2:='1';
									outcoderc<="10011001";--4
									vout:="10011001";
								else
									outcoderc<=vout;
									
								end if;
							
							when "0010"=>
								if(aux='0' and aux1='0'  and aux3='0' and aux4='0') then
									aux2:='1';
									outcoderc<="01001001";--5
									vout:="01001001";
								else
									outcoderc<=vout;
									
								end if;	
							
							when "0100"=>
								if(aux='0' and aux1='0'  and aux3='0' and aux4='0') then
									aux2:='1';
									outcoderc<="01000001";--6
									vout:="01000001";
								else
									outcoderc<=vout;
									
								end if;
							
							when "1000"=>
								if(aux='0' and aux1='0'  and aux3='0' and aux4='0') then
									aux2:='1';
									outcoderc<="11000001";--b
									vout:="11000001";
								else
									outcoderc<=vout;
									
								end if;
							when others=>null;
						end case;
						
						
						
					
					when "00010"=>
					
					
						case inkeyc is
							when "0000"=>
								if(aux='0' and aux1='0' and aux2='0' and aux4='0') then
									aux:='0';
									aux3:='0';
									outcoderc<="11111111";
								else 
									outcoderc<=vout;
								end if;
							when "0001"=>
								if(aux='0' and aux1='0' and aux2='0'  and aux4='0') then
									aux3:='1';
									outcoderc<="00011111";--7
									vout:="00011111";
								else
									outcoderc<=vout;
									
								end if;
							
							when "0010"=>
								if(aux='0' and aux1='0' and aux2='0'  and aux4='0') then
									aux3:='1';
									outcoderc<="00000001";--8
									vout:="00000001";
								else
									outcoderc<=vout;
									
								end if;
							
							when "0100"=>
								if(aux='0' and aux1='0' and aux2='0'  and aux4='0') then
									aux3:='1';
									outcoderc<="00011001";--9
									vout:="00011001";
								else
									outcoderc<=vout;
									
								end if;
							
							when "1000"=>
								if(aux='0' and aux1='0' and aux2='0'  and aux4='0') then
									aux3:='1';
									outcoderc<="01100011";--C
									vout:="01100011";
								else
									outcoderc<=vout;
									
								end if;
							when others=>null;
						end case;
					
					when "00001"=>
						case inkeyc is
							when "0000"=>
								if(aux='0' and aux1='0' and aux2='0' and aux3='0') then
									aux:='0';
									aux4:='0';
									outcoderc<="11111111";
								else 
									outcoderc<=vout;
								end if;
							when "0001"=>
								if(aux='0' and aux1='0' and aux2='0' and aux3='0' ) then
									aux4:='1';
									outcoderc<="00000011";--0
									vout:="00000011";
								else
									outcoderc<=vout;
									
								end if;
							
							when "0010"=>
								if(aux='0' and aux1='0' and aux2='0' and aux3='0' ) then
									aux4:='1';
									outcoderc<="00111001";-- * -->Cuadro arriba
									vout:="00111001";
								else
									outcoderc<=vout;
									
								end if;							
							when "0100"=>
								if(aux='0' and aux1='0' and aux2='0' and aux3='0' ) then
									aux4:='1';
									outcoderc<="11000101";--* -->Cuadro abajo
									vout:="11000101";
								else
									outcoderc<=vout;
									
								end if;
							
							when "1000"=>
								if(aux='0' and aux1='0' and aux2='0' and aux3='0' ) then
									aux4:='1';
									outcoderc<="11111101";--  menos
									vout:="11111101";
								else
									outcoderc<=vout;
									
								end if;		
								
								
							when others=>null;
						end case;
					when others=>null;
					
				end case;
		end if;
	end process;


end architecture;