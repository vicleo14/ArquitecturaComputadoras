library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;

entity lcdSalto00 is
	port(
		clkS: in std_logic;
		resets: in std_logic;
		inFlags: in std_logic;
		inconts: in std_logic_vector(2 downto 0);
		rws: out std_logic;
		rss: out std_logic;
		ENs: out std_logic;
		outCommands: out std_logic_vector(7 downto 0)
	);
end entity;

architecture lcdSalto0 of lcdSalto00 is
begin
	pconfig: process(clks)
	  begin
		if (clks'event and clks = '1') then
		  case resets is
			when '0' =>
			  outCommands <= (others => '0');
			when '1' =>
			  if (inFlags = '1') then
				case inconts is
						when "001" =>
							outCommands <= "10101001";--DDRAM AD SET
							RWs <= '0';
							RSs <= '0';
							ENs <= '1';
						  when "010" =>
							outCommands <= "10101001";--DDRAM AD SET
							RWs <= '0';
							RSs <= '0';
							ENs <= '0';

						  when "011" =>
							outCommands <= "10101001";--DDRAM AD SET
							RWs <= '0';
							RSs <= '0';
							ENs <= '1';
						  when "100" =>
							outCommands <= "10101001";--DDRAM AD SET
							RWs <= '0';
							RSs <= '0';
							ENs <= '0';
							when others => null;
						end case;
					end if;
				when others => null;
			end case;
		end if;
	end process pconfig;
end architecture;