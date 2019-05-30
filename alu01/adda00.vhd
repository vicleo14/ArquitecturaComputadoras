library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity adda00 is
	port(
			clkad: in std_logic;
			inFlagad: in std_logic;
			functad: in std_logic_vector (5 downto 0);
			inrsad:  in std_logic_vector (7 downto 0);
			inrtad:  in std_logic_vector (7 downto 0);		
			inLED: in std_logic;
			inSo: in std_logic_vector(7 downto 0);
			--SALIDA HACIA EL ACUMULADOR
			outrdad:  out std_logic_vector (7 downto 0);
			--SALIDA DEL SIGNO AL ADDER
			outSL: out std_logic;
			--SALE AL ADDER
			outRS: out std_logic_vector(7 downto 0);
			outRT: out std_logic_vector(7 downto 0);
			outLEDad: out std_logic;
			outFlagad: out std_logic
		);
end adda00;

architecture adda0 of adda00 is
--signal soutRS,soutRT:std_logic_vector(7 downto 0);
--signal soutSL: out std_logic;
begin 
	padda: process(clkad)
	variable aux: bit:='0';
	begin 
		if(clkad'event and clkad = '1') then
			if (functad ="000111") then
				case inFlagad is
					when '0'  =>
						outrdad <=(others => '0');
						aux:='0';
						outrdad <= inSo;
						outLEDad<=inLED;
						outFlagad <='0';
						outSL<='0';
					when '1' =>
						if (aux ='0') then
							outRS<=inRSad;
							outRT<=inRTad;
							aux:='1';
							outFlagad <= '1';
						end if;
					when others => null;
				end case;
			else
				aux:='0';
				outrdad<=(others=>'Z');
				outFlagad<='Z';
				outLEDad<='Z';
				outSL<='Z';
				outRS<=(others=>'Z');
				outRT<=(others=>'Z');
			end if;
		end if;
	end process padda;
end adda0;