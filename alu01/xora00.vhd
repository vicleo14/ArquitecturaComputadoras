library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity xora00 is
	port(
			clkxo: in std_logic;
			inFlagxo: in std_logic;
			functxo: in std_logic_vector (5 downto 0);
			inrsxo:  in std_logic_vector (7 downto 0);
			inrtxo:  in std_logic_vector (7 downto 0);			
			outrdxo:  out std_logic_vector (7 downto 0);
			outFlagxo: out std_logic
		);
end xora00;

architecture xora0 of xora00 is
begin 
	pxor: process(clkxo)
	variable aux: bit:='0';
	begin 
		if(clkxo'event and clkxo = '1') then
			if (functxo ="000010") then
				case inFlagxo is
					when '0'  =>
						outrdxo <=(others => '0');
						outFlagxo <= '0';
						aux:='0';
					when '1' =>
						if (aux ='0') then
							aux:='1';
							outrdxo <= inrsxo xor inrtxo;
							outFlagxo <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdxo<=(others=>'Z');
				outFlagxo<='Z';
			end if;
		end if;
	end process pxor;
end xora0;