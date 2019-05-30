library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity nora00 is
	port(
			clknor: in std_logic;
			inFlagnor: in std_logic;
			functnor: in std_logic_vector (5 downto 0);
			inrsnor:  in std_logic_vector (7 downto 0);
			inrtnor:  in std_logic_vector (7 downto 0);			
			outrdnor:  out std_logic_vector (7 downto 0);
			outFlagnor: out std_logic
		);
end nora00;

architecture nora0 of nora00 is
begin 
	pnor: process(clknor)
	variable aux: bit:='0';
	begin 
		if(clknor'event and clknor = '1') then
			if (functnor ="000100") then
				case inFlagnor is
					when '0'  =>
						outrdnor <=(others => '0');
						outFlagnor <= '0';
						aux:='0';
					when '1' =>
						if (aux ='0') then
							aux:='1';
							outrdnor <= inrsnor nor inrtnor;
							outFlagnor <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdnor<=(others=>'Z');
				outFlagnor<='Z';
			end if;
		end if;
	end process pnor;
end nora0;