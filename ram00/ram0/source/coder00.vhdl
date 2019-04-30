library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity coder00 is
	port(
		clkc: in std_logic;
		inkeyc: in std_logic_vector(3 downto 0);
		incontc: in std_logic_vector(3 downto 0);
		outFlagc:out std_logic;
		outcoderc: inout std_logic_vector(7 downto 0);
		outcontc:inout std_logic_vector(3 downto 0)--Revisar
		
	);
end entity;

architecture coder0 of coder00 is
signal scontrol:std_logic_vector(1 downto 0);--aG

begin
--scontrol<=enc
	pcoder: process(clkc)
	variable aux: bit;
	begin
	
		if(clkc'event and clkc='1') then
			case scontrol is
				when "00"=>
					aux:='0';
					outcoderc<=(others=>'1');
					outcontc<="0000";
				when "01"=>
					aux:='0';
					outcoderc<=(others=>'1');
					outcontc<="0000";
				--when "10"=>--write
				when others =>null;
				
			
			case incontc is
				when "1000"=>
					case inkeyc is
						when "0000"=>
							aux:='0';
							outcontc<=outcontc;
							outFlagc<='0';
						when "0001"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="10011111";--1
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						
						when "0010"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00100101";--2
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						
						when "0100"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00001101";--3
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						
						when "1000"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00010001";--A
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						when others=>
							outcoderc<=outcoderc;
					end case;
					
					
				when "0100"=>
					case inkeyc is
						--when "0000"=>
						--	aux:='0';
						when "0001"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="10011001";--4
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						
						when "0010"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="01001001";--5
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						
						when "0100"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="01000001";--6
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						
						when "1000"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="11000001";--b
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
							end if;
						when others=>
							outcoderc<=outcoderc;
					end case;
					
					
					
				
				when "0010"=>			
					case inkeyc is
						--when "0000"=>
						--	aux:='0';
						when "0001"=>
							if(aux='0') then
								aux:='1';
								outcoderc<="00011111";--7
								outcontc<=outcontc+1;
								outFlagc<='1';
							else
								outFlagc<='0';
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
						when others=>
							outcoderc<=outcoderc;
					end case;
				
				when "0001"=>
					case inkeyc is
						--when "0000"=>
						--	aux:='0';
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
						when others=>
							outcoderc<=outcoderc;
					end case;
				when others=>
					outcoderc<=outcoderc;--aqui cambio y no se que fue
				
			end case;
			end case;
		end if;
	end process;


end architecture;