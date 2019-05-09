library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity stack01 is
  port(
       clkst: in std_logic;
	   enst: in std_logic;
	   rwst: in std_logic;
	   inFlagst: in std_logic;
	   indirWst: inout std_logic_vector(4 downto 0);
	   indirRst: in std_logic_vector(4 downto 0);
       inwordWst: in std_logic_vector(7 downto 0);
	   outwordSt: out std_logic_vector(7 downto 0);
	   inFlagContSt: in std_logic
	   );
end stack01;

architecture stack0 of stack01 is
	type arraystack is array(0 to 63) of std_logic_vector(7 downto 0);
	signal wordstack: arraystack;
	signal scontr: std_logic_vector(1 downto 0);
	begin
		scontr <= (enst)&(rwst);
		
		pstack:process(clkst)
		variable cont: std_logic_vector(4 downto 0):="00000";
		variable wordTmp: std_logic_vector(7 downto 0):="00000000";
		
		begin
		
			if(clkst'event and clkst='1') then
				case scontr is
					when "00"=>
						outwordst<=(others=>'1');
					when "01"=>
						outwordst<=(others=>'1');
					when "10"=>
						case inFlagst is
							when '1'=>
								wordTmp:=inwordWst;
								outwordSt<="11111111";
							when others=>null;
						end case;
						
						case inFlagContSt is
							when '1'=>
								wordstack(conv_integer(indirWst))<=wordTmp;
							when others=>null;
						end case;
								
					when "11"=>
						if(indirRst>"00000") then
						
							outwordSt<=wordstack(conv_integer(indirRst));
							
						else
						
							outwordSt<="11111111";
						end if;
					when others=>null;
				end case;
			end if;
		end process;
end architecture;