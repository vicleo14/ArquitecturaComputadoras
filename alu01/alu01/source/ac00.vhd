library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity ac00 is
	port(
			clkac: in std_logic;
			enableac: in std_logic;
			inFlagac: in std_logic;
			inac8bits: in std_logic_vector(7 downto 0);
			inac16bits: in std_logic_vector(15 downto 0);
			inFlag16bits: std_logic;
			outac: out std_logic_vector(15 downto 0);
			outFlagac: out std_logic
		);
end ac00;

architecture ac0 of ac00 is
begin
	pac: process (clkac)
	variable aux: bit:='0';
	begin
		if(clkac'event and clkac ='1') then
			case enableac is
				when '0' =>
					--outac <=(others => '0');
					aux:='0';
					outFlagac <= '0';
				when '1' =>
					case inFlagac is
						when '0' =>
							if(aux='0') then
								aux:='1';
								outac <=(others => '0');
								outFlagac <= '1';
							end if;
						when '1' =>
							if(aux='1') then
								aux:='0';
								outFlagac<='0';

								case inFlag16bits is
									when '0'=>
										outac <= ("00000000")&inac8bits;
									when '1'=>
										outac <= inac16bits;
									when others=> null;
								end case;
							end if;
							--outFlagac <= '1';--DUDA
						when others => null;
					end case;
				when others => null;
			end case;
		end if;
	end process pac;
end ac0;