library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xnora00 is
	port(
			clkxno: in std_logic;
			inFlagxno: in std_logic;
			functxno: in std_logic_vector (5 downto 0);
			inrsxno:  in std_logic_vector (7 downto 0);
			inrtxno:  in std_logic_vector (7 downto 0);			
			outrdxno:  out std_logic_vector (7 downto 0);
			outFlagxno: out std_logic
		);
end xnora00;

architecture xnora0 of xnora00 is
begin 
	pxnor: process(clkxno)
	variable aux: bit:='0';
	begin 
		if(clkxno'event and clkxno = '1') then
			if (functxno ="000101") then
				case inFlagxno is
					when '0'  =>
						outrdxno <=(others => '0');
						outFlagxno <= '0';
						aux:='0';
					when '1' =>
						if (aux ='0') then
							aux:='1';
							outrdxno <= inrsxno xnor inrtxno;
							outFlagxno <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdxno<=(others=>'Z');
				outFlagxno<='Z';
			end if;
		end if;
	end process pxnor;
end xnora0;