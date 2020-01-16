library ieee;
use ieee.std_logic_1164.all;

entity example_tb is
end example_tb;

architecture test of example_tb is
  component composite_XOR
  port
    (
    A: in std_ulogic;
    B: in std_ulogic;
    F: out std_ulogic
    );
  end component;
  signal A, B, F : std_ulogic;
begin
  part: composite_XOR port map (A => A, B => B, F => F);

  process begin
    A <= 'X';
    B <= 'X';
    wait for 1 ns;
    A <= '0';
    B <= '0';
    wait for 1 ns;
    A <= '0';
    B <= '1';
    wait for 1 ns;
    A <= '1';
    B <= '0';
    wait for 1 ns;
    A <= '1';
    B <= '1';
    wait for 1 ns;
    assert false report "Reached end of test";
    wait;
  end process;

end test;
