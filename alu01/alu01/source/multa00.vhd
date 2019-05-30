library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

entity multa00 is
	port(
			clkml: in std_logic;
			inFlagml: in std_logic;
			functml: in std_logic_vector (5 downto 0);
			inrsml:  in std_logic_vector (7 downto 0);
			inrtml:  in std_logic_vector (7 downto 0);
			inSo: in std_logic_vector(15 downto 0);
			--SALIDA HACIA EL ACUMULADOR
			outrdml:  out std_logic_vector (15 downto 0);
			
			--SALE AL MULTIPLICADOR
			outRS: out std_logic_vector(7 downto 0);
			outRT: out std_logic_vector(7 downto 0);
			outFlag16bits: out std_logic;
			outFlagml: out std_logic
		);
end multa00;

architecture multa0 of multa00 is
--signal soutRS,soutRT:std_logic_vector(7 downto 0);
--signal soutSL: out std_logic;
begin 
	pmulta: process(clkml)
	variable aux: bit:='0';
	begin 
		if(clkml'event and clkml = '1') then
			if (functml ="001001") then
				outFlag16bits<='1';
				case inFlagml is
					when '0'  =>
						outrdml <=(others => '0');
						outFlagml <= '0';
						outrdml <= inSo;
						
						aux:='0';
					when '1' =>
						if (aux ='0') then
							outRS<=inRSml;
							outRT<=inRTml;
							aux:='1';
							outFlagml <='1';
						end if;
					when others => null;
				end case;
			else
				outFlag16bits<='0';
				aux:='0';
				outrdml<=(others=>'Z');
				outFlagml<='Z';
				outRS<=(others=>'Z');
				outRT<=(others=>'Z');
			end if;
		end if;
	end process pmulta;
end multa0;