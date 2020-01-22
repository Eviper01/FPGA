library ieee;
use ieee.std_logic_1164.all;

entity COUNTER is
  port(d: in std_logic_vector (7 downto 0);
        q: out std_logic_vector (7 downto 0):="00000000";
       clk: in std_logic;
       C_EN: in std_logic;
       J_EN: in std_logic);
    end COUNTER;

architecture COUNTER_arch of COUNTER is
  component REG8
  port (d: in std_logic_vector (7 downto 0):="00000000";
        clk: in std_logic; -- clock.
        q: out std_logic_vector (7 downto 0):="00000000");
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
  signal ih0,ih1,ih2,ih3,ih4,ih5: std_logic;
  signal i,o,ox:std_logic_vector(7 downto 0);
begin
  IN_BUFFER: BUS_TRANSCIEVER port map (d(0),d(1),d(2),d(3),d(4),d(5),d(6),d(7),J_EN,i(0),i(1),i(2),i(3),i(4),i(5),i(6),i(7));
  COUNT_BUFFER: BUS_TRANSCIEVER port map (ox(0),ox(1),ox(2),ox(3),ox(4),ox(5),ox(6),ox(7),C_EN,i(0),i(1),i(2),i(3),i(4),i(5),i(6),i(7));
  REG: REG8 port map (i,clk,o);
  B0: BUF port map (o(0),q(0));
  B1: BUF port map (o(1),q(1));
  B2: BUF port map (o(2),q(2));
  B3: BUF port map (o(3),q(3));
  B4: BUF port map (o(4),q(4));
  B5: BUF port map (o(5),q(5));
  B6: BUF port map (o(6),q(6));
  B7: BUF port map (o(7),q(7));
  L0: INV port map (o(0),ox(0));
  L1: dual_XOR port map (o(0),o(1),ox(1));
  A1: dual_AND port map (o(0),o(1),ih0);
  L2: dual_XOR port map (ih0,o(2),ox(2));
  A2: dual_AND port map (ih0,o(2),ih1);
  L3: dual_XOR port map (ih1,o(3),ox(3));
  A3: dual_AND port map (ih1,o(3),ih2);
  L4: dual_XOR port map (ih2,o(4),ox(4));
  A4: dual_AND port map (ih2,o(4),ih3);
  L5: dual_XOR port map (ih3,o(5),ox(5));
  A5: dual_AND port map (ih3,o(5),ih4);
  L6: dual_XOR port map (ih4,o(6),ox(6));
  A6: dual_AND port map (ih4,o(6),ih5);
  L7: dual_XOR port map (ih5,o(7),ox(7));

end architecture;
