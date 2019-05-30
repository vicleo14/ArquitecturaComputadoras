library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nota00 is
	port(
			clkno: in std_logic;
			inFlagno: in std_logic;
			functno: in std_logic_vector (5 downto 0);
			inrsno:  in std_logic_vector (7 downto 0);			
			outrdno:  out std_logic_vector (7 downto 0);
			outFlagno: out std_logic
		);
end nota00;

architecture nota0 of nota00 is
begin 
	pnot: process(clkno)
	variable aux: bit:='0';
	begin 
		if(clkno'event and clkno = '1') then
			if (functno ="000110") then
				case inFlagno is
					when '0'  =>
						outrdno <=(others => '0');
						outFlagno <= '0';
						aux:='0';
					when '1' =>
						if (aux ='0') then
							aux:='1';
							outrdno <= not inrsno ;
							outFlagno <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdno<=(others=>'Z');
				outFlagno<='Z';
			end if;
		end if;
	end process pnot;
end nota0;