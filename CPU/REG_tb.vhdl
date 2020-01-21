library ieee;
use ieee.std_logic_1164.all;

entity REG8_tb is
end entity;

architecture REG8_tb_test of REG8_tb is
component REG8
port (d0: in std_logic;
      d1: in std_logic;
      d2: in std_logic;
      d3: in std_logic;
      d4: in std_logic;
      d5: in std_logic;
      d6: in std_logic;
      d7: in std_logic;
      clk: in std_logic; -- clock.
      q0: out std_logic;
      q1: out std_logic;
      q2: out std_logic;
      q3: out std_logic;
      q4: out std_logic;
      q5: out std_logic;
      q6: out std_logic;
      q7: out std_logic);
end component;

  signal d0,d1,d2,d3,d4,d5,d6,d7,q0,q1,q2,q3,q4,q5,q6,q7,clk:std_logic;

begin
  mapping: REG8 port map(d0,d1,d2,d3,d4,d5,d6,d7,clk,q0,q1,q2,q3,q4,q5,q6,q7);
  process begin
  d0 <= '0';
  d1 <= '0';
  d2 <= '0';
  d3 <= '0';
  d4 <= '1';
  d5 <= '1';
  d6 <= '1';
  d7 <= '1';
  clk <= '1';
  wait for 1 ns;
  clk <= '0';
  wait for 1 ns;
  clk <='1';
  d0 <= '1';
  d1 <= '1';
  d2 <= '1';
  d3 <= '0';
  d4 <= '0';
  d5 <= '0';
  d6 <= '0';
  d7 <= '0';
  clk <= '1';
  wait for 1 ns;
  clk <= '0';
  wait for 1 ns;
  assert false report "Yeet done";
  wait;
end process;
end architecture;
