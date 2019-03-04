library ieee;
use ieee.std_logic_1164.all;
library lattice;
use lattice.all;

package packagetopShifters00 is
	component topshiftRL00
		port(
			clk00:inout std_logic;
			cdiv00: in std_logic_vector(4 downto 0);
			en0: in std_logic;
			ins0: in std_logic_vector(7 downto 0);
			outs0:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component topshiftRD00
		port(
			clks: in std_logic;
			enables: in std_logic;
			ins:in std_logic_vector(7 downto 0);
			outs:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component toprotIzq
		port(
			clks: in std_logic;
			enables: in std_logic;
			ins:in std_logic_vector(7 downto 0);
			outs:out std_logic_vector(7 downto 0)
		);
	end component;
	
	component toprotDer
		port(
			clks: in std_logic;
			enables: in std_logic;
			ins:in std_logic_vector(7 downto 0);
			outs:out std_logic_vector(7 downto 0)
		);
	end component;

	
	
end package;