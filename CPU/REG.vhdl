library ieee;
use ieee.std_logic_1164.all;

entity REG8 is
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
end entity;

architecture REG8_beh of REG8 is

begin
  process(clk)
  begin
    if rising_edge(clk) then
      q0 <= d0;
      q1 <= d1;
      q2 <= d2;
      q3 <= d3;
      q4 <= d4;
      q5 <= d5;
      q6 <= d6;
      q7 <= d7;
    end if;
    end process;
      end architecture;
