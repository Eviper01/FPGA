library ieee;
use ieee.std_logic_1164.all;

entity REG8_tb is
end entity;

architecture REG8_tb_test of REG8_tb is
component REG8_Stable
port (d: in std_logic_vector (7 downto 0):="00000000";
      clk: in std_logic; -- clock.
      q: out std_logic_vector (7 downto 0):="00000000");
end component;

  signal clk:std_logic;
  signal d,q: std_logic_vector(7 downto 0);

begin
  mapping: REG8_Stable port map(d,clk,q);
  process begin
  d(0) <= 'Z';
  d(1) <= 'Z';
  d(2) <= 'Z';
  d(3) <= 'Z';
  d(4) <= 'Z';
  d(5) <= 'Z';
  d(6) <= 'Z';
  d(7) <= 'Z';
  clk <= '0';
  wait for 1 ns;
  clk <= '0';
  wait for 1 ns;
  clk <='1';
  d(0) <= '1';
  d(1) <= '0';
  d(2) <= '0';
  d(3) <= '0';
  d(4) <= '0';
  d(5) <= '0';
  d(6) <= '0';
  d(7) <= '0';
  clk <= '1';
  wait for 1 ns;
  clk <= '0';
  wait for 1 ns;
  d <="ZZZZZZZZ";
  wait for 1 ns;
  clk<='0';
  wait for 3 ns;
  assert false report "Yeet done";
  wait;
end process;
end architecture;
