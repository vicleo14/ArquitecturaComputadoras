library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library lattice;
use lattice.all;
use packagediv00.all;

entity lcdConfig00 is

	port(
		clkc: in std_logic;
		resetc: in std_logic;
		inFlagc: in std_logic;
		incontc: in std_logic_vector(5 downto 0);
		rwc: out std_logic;
		rsc: out std_logic;
		ENc: out std_logic;
		outCommandc: out std_logic_vector(7 downto 0);
		outFlagC: out std_logic
	);
end entity;
architecture lcdConfig0 of lcdConfig00 is
begin
  pconfig: process(clkc)
  begin
    if (clkc'event and clkc = '1') then
	  case resetc is
	    when '0' =>
		  outCommandc <= (others => '0');
		  outFlagc <= '0';
		when '1' =>
		  if (inFlagc = '1') then
		    case incontc is
			  when "000001" =>
			    outCommandc <= "00000001";--SCREEN CLEAR
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
				outFlagc <= '0';
			  when "000010" =>
			    outCommandc <= "00000001";--SCREEN CLEAR
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '0';
-------------------------------------------------
			  when "000011" =>
			    outCommandc <= "00000001";--SCREEN CLEAR
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
				outFlagc <= '0';
			  when "000100" =>
			    outCommandc <= "00000001";--SCREEN CLEAR
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '0';
-----------------------------------------------------

			  when "000101" =>
			    outCommandc <= "00000010";--CURSOR RETURN
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
				outFlagc <= '0';
			  when "000110" =>
			    outCommandc <= "00000010";--CURSOR RETURN
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '0';

			  when "000111" =>
			    outCommandc <= "00000110";--INPUT SET
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
				outFlagc <= '0';
			  when "001000" =>
			    outCommandc <= "00000110";--INPUT SET
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '0';


			  when "001001" =>
			    outCommandc <= "00001111";--DISPLAY SWITCH
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
				outFlagc <= '0';
			  when "001010" =>
			    outCommandc <= "00001111";--DISPLAY SWITCH
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '0';


			  when "001011" =>
			    outCommandc <= "00011100";--SHIFT
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
				outFlagc <= '0';
			  when "001100" =>
			    outCommandc <= "00011100";--SHIFT
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '0';


			  when "001101" =>
			    outCommandc <= "00111100";--FUNCTION SET
				RWc <= '0';
				RSc <= '0';
				ENc <= '1';
				outFlagc <= '0';
			  when "001110" =>
			    outCommandc <= "00111100";--FUNCTION SET
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '0';


			  --when "001111" =>
			--	outCommandc <= "10101000";--DDRAM AD SET
			--	RWc <= '0';
			--	RSc <= '0';
			--	ENc <= '1';
			--	outFlagc <= '0';
			
			 --when "010000" =>
			   --outCommandc <= "10101001";--DDRAM AD SET
				--RWc <= '0';
				--RSc <= '0';
				--ENc <= '0';
                --outFlagc <= '0';

			--when "010001" =>
			  --outCommandc <= "10101001";--DDRAM AD SET
			--	RWc <= '0';
			--	RSc <= '0';
			--	ENc <= '1';
			--	outFlagc <= '0';
			 when "010000" =>
			   outCommandc <= "10101001";--DDRAM AD SET
				RWc <= '0';
				RSc <= '0';
				ENc <= '0';
                outFlagc <= '1';

			  when others => null;
			end case;

		  end if;
		when others => null;
	  end case;
	end if;
  end process pconfig;
end lcdConfig0;