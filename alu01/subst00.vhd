library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity subst00 is
	port(
			clksb: in std_logic;
			inFlagsb: in std_logic;
			functsb: in std_logic_vector (5 downto 0);
			inrssb:  in std_logic_vector (7 downto 0);
			inrtsb:  in std_logic_vector (7 downto 0);		
			inLED: in std_logic;
			inSo: in std_logic_vector(7 downto 0);
			--SALIDA HACIA EL ACUMULADOR
			outrdsb:  out std_logic_vector (7 downto 0);
			--SALIDA DEL SIGNO AL ADDER
			outSL: out std_logic;
			--SALE AL ADDER
			outRS: out std_logic_vector(7 downto 0);
			outRT: out std_logic_vector(7 downto 0);
			outLEDsb: out std_logic;
			outFlagsb: out std_logic
		);
end subst00;

architecture subst0 of subst00 is
--signal soutRS,soutRT:std_logic_vector(7 downto 0);
--signal soutSL: out std_logic;
begin 
	psubst: process(clksb)
	variable aux: bit:='0';
	begin 
		if(clksb'event and clksb = '1') then
			if (functsb ="001000") then
				
				case inFlagsb is
					when '0'  =>
						outrdsb <=(others => '0');
						outFlagsb <= '0';
						outrdsb <= inSo;
						outLEDsb<=inLED;
						outSL<='1';
						aux:='0';
					when '1' =>
						if (aux ='0') then
							outRS<=inRSsb;
							outRT<=inRTsb;
							aux:='1';
							outFlagsb <='1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdsb<=(others=>'Z');
				outFlagsb<='Z';
				outLEDsb<='Z';
				outSL<='Z';
				outRS<=(others=>'Z');
				outRT<=(others=>'Z');
			end if;
		end if;
	end process psubst;
end subst0;