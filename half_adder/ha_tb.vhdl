-- OR gate (ESD book figure 2.3)
--
-- two descriptions provided
--------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------

entity OR_ent_tb is
end OR_ent_tb;

architecture test of OR_ent_tb is
	component OR_ent
	port(	x: in std_logic;
		y: in std_logic;
		F: out std_logic
	);
end component;
signal x,y,F : std_logic;
begin
	mapping: OR_ent port map (x => x, y => y, F => F);
	process begin
	x <= 'X';
	y <= 'X';
	wait for 1 ns;
	x <= '0';
	y <= '0';
	wait for 1 ns;
	x <= '0';
	y <= '1';
	wait for 1 ns;
	x <= '1';
	y <= '0';
	wait for 1 ns;
	x <= '1';
	y <= '1';
	wait for 1 ns;
	assert false report "Yeet done";
	wait;
end process;
end test;
