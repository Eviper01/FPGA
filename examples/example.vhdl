library ieee;
use ieee.std_logic_1164.all;

entity dual_NOR is
  port (A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_NOR;

architecture dual_NOR_beh of dual_NOR is
begin
    F <= A nor B;
end dual_NOR_beh;

library ieee;
use ieee.std_logic_1164.all;

entity composite_XOR is
  port (A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end composite_XOR;

architecture composite_XOR_beh of composite_XOR is
  component dual_NOR
    port (A: in std_logic;
    B: in std_logic;
    F: out std_logic);
  end component;
  signal I0, I1, I2, I3 : std_logic;

begin
C1: dual_NOR port map (A,A,I0);
C2: dual_NOR port map (B,B,I1);
C3: dual_NOR port map (A,B,I2);
C4: dual_NOR port map (I0,I1,I3);
C5: dual_NOR port map (I2,I3,F);
end composite_XOR_beh;
