library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity ram00 is
  port(
       clkra: in std_logic;
	   enra: in std_logic;
	   rwra: in std_logic;
	   inFlagra: in std_logic;
	   indirWra: in std_logic_vector(4 downto 0);
	   indirRra: in std_logic_vector(4 downto 0);
       inwordWra: in std_logic_vector(7 downto 0);
	   outwordra: out std_logic_vector(7 downto 0));
end ram00;

architecture ram0 of ram00 is
	type arrayram is array(0 to 63) of std_logic_vector(7 downto 0);
	signal wordram: arrayram;
	signal scontr: std_logic_vector(1 downto 0);
	begin
		scontr <= (enra)&(rwra);
		
		pram:process(clkra)
		begin
			if(clkra'event and clkra='1') then
				case scontr is
					when "00"=>
						outwordra<=(others=>'1');
					when "01"=>
						outwordra<=(others=>'1');
					when "10"=>
						case inFlagra is
							when '1'=>
								wordram(conv_integer(indirWra))<=inwordWra;
							when others=>null;
						end case;
					when "11"=>
						outwordRa<=wordram(conv_integer(indirRra));
					when others=>null;
				end case;
			end if;
		end process;
end architecture;