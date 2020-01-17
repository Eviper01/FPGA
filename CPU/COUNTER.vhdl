library ieee;
use ieee.std_logic_1164.all;

entity COUNTER is
  port(d0: in std_logic;
       d1: in std_logic;
       d2: in std_logic;
       d3: in std_logic;
       d4: in std_logic;
       d5: in std_logic;
       d6: in std_logic;
       d7: in std_logic;
       q0: out std_logic;
       q1: out std_logic;
       q2: out std_logic;
       q3: out std_logic;
       q4: out std_logic;
       q5: out std_logic;
       q6: out std_logic;
       q7: out std_logic;
       clk: in std_logic;
       C_EN: in std_logic;
       J_EN: in std_logic);
    end COUNTER;

architecture COUNTER_arch of COUNTER is
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
  component dual_XOR is
    port(A: in std_logic;
    B: in std_logic;
    F: out std_logic);
  end component;
  component dual_AND is --might not be needed
    port (A: in std_logic;
    B: in std_logic;
    F: out std_logic);
  end component;
  component BUS_TRANSCIEVER is
    port (d0: in std_logic;
          d1: in std_logic;
          d2: in std_logic;
          d3: in std_logic;
          d4: in std_logic;
          d5: in std_logic;
          d6: in std_logic;
          d7: in std_logic;
          EN: in std_logic; -- ENABLE.
          q0: out std_logic;
          q1: out std_logic;
          q2: out std_logic;
          q3: out std_logic;
          q4: out std_logic;
          q5: out std_logic;
          q6: out std_logic;
          q7: out std_logic);
  end component;
  component BUF
  port(A: in std_logic;
  F: out std_logic);
  end component;
  component INV is
    port (A: in std_logic;
    F: out std_logic);
  end component;
  signal i0,i1,i2,i3,i4,i5,i6,i7,o0,o1,o2,o3,o4,o5,o6,o7,ox0,ox1,ox2,ox3,ox4,ox5,ox6,ox7,ih0,ih1,ih2,ih3,ih4,ih5: std_logic;
begin
  IN_BUFFER: BUS_TRANSCIEVER port map (d0,d1,d2,d3,d4,d5,d6,d7,J_EN,i0,i1,i2,i3,i4,i5,i6,i7);
  COUNT_BUFFER: BUS_TRANSCIEVER port map (ox0,ox1,ox2,ox3,ox4,ox5,ox6,ox7,C_EN,i0,i1,i2,i3,i4,i5,i6,i7);
  REG: REG8 port map (i0,i1,i2,i3,i4,i5,i6,i7,clk,o0,o1,o2,o3,o4,o5,o6,o7);
  B0: BUF port map (o0,q0);
  B1: BUF port map (o1,q1);
  B2: BUF port map (o2,q2);
  B3: BUF port map (o3,q3);
  B4: BUF port map (o4,q4);
  B5: BUF port map (o5,q5);
  B6: BUF port map (o6,q6);
  B7: BUF port map (o7,q7);
  L0: INV port map (o0,ox0);
  L1: dual_XOR port map (o0,o1,ox1);
  A1: dual_AND port map (o0,o1,ih0);
  L2: dual_XOR port map (ih0,o2,ox2);
  A2: dual_AND port map (ih0,o2,ih1);
  L3: dual_XOR port map (ih1,o3,ox3);
  A3: dual_AND port map (ih1,o3,ih2);
  L4: dual_XOR port map (ih2,o4,ox4);
  A4: dual_AND port map (ih2,o4,ih3);
  L5: dual_XOR port map (ih3,o5,ox5);
  A5: dual_AND port map (ih3,o5,ih4);
  L6: dual_XOR port map (ih4,o6,ox6);
  A6: dual_AND port map (ih4,o6,ih5);
  L7: dual_XOR port map (ih5,o7,ox7);

end architecture;
