library ieee;
use ieee.std_logic_1164.all;

entity REG8 is
  port (d0: in std_logic:='0';
        d1: in std_logic:='0';
        d2: in std_logic:='0';
        d3: in std_logic:='0';
        d4: in std_logic:='0';
        d5: in std_logic:='0';
        d6: in std_logic:='0';
        d7: in std_logic:='0';
        clk: in std_logic; -- clock.
        q0: out std_logic:='0';
        q1: out std_logic:='0';
        q2: out std_logic:='0';
        q3: out std_logic:='0';
        q4: out std_logic:='0';
        q5: out std_logic:='0';
        q6: out std_logic:='0';
        q7: out std_logic:='0');
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
