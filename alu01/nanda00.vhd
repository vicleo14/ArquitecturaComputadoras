library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nanda00 is
	port(
			clkna: in std_logic;
			inFlagna: in std_logic;
			functna: in std_logic_vector (5 downto 0);
			inrsna:  in std_logic_vector (7 downto 0);
			inrtna:  in std_logic_vector (7 downto 0);			
			outrdna:  out std_logic_vector (7 downto 0);
			outFlagna: out std_logic
		);
end nanda00;

architecture nanda0 of nanda00 is
begin 
	pna: process(clkna)
	variable aux: bit:='0';
	begin 
		if(clkna'event and clkna = '1') then
			if (functna ="000011") then
				case inFlagna is
					when '0'  =>
						outrdna <=(others => '0');
						outFlagna <= '0';
						aux:='0';
					when '1' =>
						if (aux ='0') then
							aux:='1';
							outrdna <= inrsna nand inrtna;
							outFlagna <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdna<=(others=>'Z');
				outFlagna<='Z';
			end if;
		end if;
	end process pna;
end nanda0;