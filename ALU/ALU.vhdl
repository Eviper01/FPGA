--basic logic components of the ALU
library ieee;
use ieee.std_logic_1164.all;

entity INV is
  port (A: in std_logic;
  F: out std_logic);
end INV;

architecture INV_beh of INV is
begin
    F <= not A;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity dual_AND is
  port (A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_AND;

architecture dual_AND_beh of dual_AND is
begin
    F <= A and B;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity triple_AND is
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  F: out std_logic);
end triple_AND;

architecture triple_AND_beh of triple_AND is
begin
    F <= A and B and C;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity quad_AND is
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  F: out std_logic);
end quad_AND;

architecture quad_AND_beh of quad_AND is
begin
    F <= A and B and C and D;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity pent_AND is
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  E: in std_logic;
  F: out std_logic);
end pent_AND;

architecture pent_AND_beh of pent_AND is
begin
    F <= A and B and C and D and E;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity dual_XOR is
  port(A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_XOR;

architecture dual_XOR_beh of dual_XOR is
begin
  F <= A xor B;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity dual_NOR is
  port(A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_NOR;

architecture dual_NOR_beh of dual_NOR is
begin
  F <= A nor B;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity triple_NOR is
  port(A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  F: out std_logic);
end triple_NOR;

architecture triple_NOR_beh of triple_NOR is
begin
  F <= ((not A) and (not B) and (not C));
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity quad_NOR is
  port(A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  F: out std_logic);
end quad_NOR;

architecture quad_NOR_beh of quad_NOR is
begin
  F <= ((not A) and (not B) and (not C) and (not D));
end architecture;

library ieee;
use ieee.std_logic_1164.all;

-- actual ALU design
entity ALU is
  port(
      A0: in std_logic;
      A1: in std_logic;
      A2: in std_logic;
      A3: in std_logic;
      B0: in std_logic;
      B1: in std_logic;
      B2: in std_logic;
      B3: in std_logic;
      S0: in std_logic;
      S1: in std_logic;
      S2: in std_logic;
      S3: in std_logic;
      M:  in std_logic;
      Cin: in std_logic;
      F0: out std_logic;
      F1: out std_logic;
      F2: out std_logic;
      F3: out std_logic;
      Cout: out std_logic;
      AEB: out std_logic
      );
  end ALU;

architecture ALU_str of ALU is

  component INV
    port (A: in std_logic;
    F: out std_logic);
  end component;

  component quad_NOR is
    port(A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    D: in std_logic;
    F: out std_logic);
  end component;

  component triple_NOR is
    port(A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    F: out std_logic);
  end component;

  component dual_NOR is
    port(A: in std_logic;
    B: in std_logic;
    F: out std_logic);
  end component;

  component dual_XOR is
    port(A: in std_logic;
    B: in std_logic;
    F: out std_logic);
  end component;

  component pent_AND is
    port (A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    D: in std_logic;
    E: in std_logic;
    F: out std_logic);
  end component;

  component quad_AND is
    port (A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    D: in std_logic;
    F: out std_logic);
  end component;

  component triple_AND is
    port (A: in std_logic;
    B: in std_logic;
    C: in std_logic;
    F: out std_logic);
  end component;

  component dual_AND is
    port (A: in std_logic;
    B: in std_logic;
    F: out std_logic);
  end component;
--n is used to designate an output from an inverter, G is used to designate an and gate outpt , I is used to designate an nor gate output
  signal nI0,nI1,nI2,nI3,nI4,nI5,nI5,nI7,nG16,nG33,nM,nB0,nB1,nB2,nB3,I0,I1,I2,I3,I4,I5,I6,I7,G0,G1,G2,G3,G4,G5,G6,G7,G8,G9,G10,G11,G12,G13,G14,G15,G16,G17,G18,G19,G20,G21,G22,G23,G24,G25,G26,G27,G28,G29,G30,G31,G32,G33,G34,G35,G36,G37: std_logic
  begin
    -- c is used to desginate a components port map
    C0: INV port map (B0, nB0);
    C1: INV port map (B1, nB1);
    C2: INV port map (B2, nB2);
    C3: INV port map (B3, nB3);
    C4: dual_AND port map (B0, S0, G0);
    C5: dual_AND port map (nB0, S1, G1);
    C6: triple_AND port map (nB0, A0, S2, G2);
    C7: triple_AND port map (A0,B0,S3,G3);
    C8: dual_AND port map (B1,S0,G4);
    C9: dual_AND port map (S1,nB1,G5);
    C10: triple_AND port map (nB1,A1,S2,G6);
    C11: triple_AND port map (A1,B2,S3,G7);
    C12: dual_AND port map (B2,S0,G8);
    C13: dual_AND port map (S1,nB2,G9);
    C14: triple_AND port map (nB2,A2,S2,G10);
    C15: triple_AND port map (A2,B2,S3,G11);
    C16: dual_AND port map (B3,S0,G12);
    C17: dual_AND port map (S1,nB3,G13);
    C18: triple_AND port map (nB3,A3,S2,G14);
    C19: triple_AND port map (A3,B3,S3,G15);
    --row of nor gates
    C20: triple_NOR port map (A0,G0,G1,I0);
    C21: dual_NOR port map (G2,G3,I1);
    C22: triple_NOR port map (A1,G4,G5,I2);
    C23: dual_NOR port map (G6,G7,I3);
    C24: triple_NOR port map (A2,G8,G9,I4);
    C25: dual_NOR port map (G10,G11,I5);
    C26: triple_NOR port map (A3,G12,G13,I6);
    C27: dual_NOR port map (G14,G15,I7);
    -- output stage;
    K0: INV port map (M,nM);
    C28: dual_AND port map (Cin,nM,G16);
    K1: INV port map (G16,nG16);
    K2: INV port map (I0,nI0);
    C29: dual_AND port map (nI0,I1,G17);
    X0: dual_XOR port map (nG16,G17,F0);

    C30: dual_AND port map (nM,I0,G18);
    C31: triple_AND port map (I1,Cin,nM,G19);
    C32: dual_NOR port map (G18,G19,G20);
    K3: INV port map (I2,nI2);
    C33: dual_AND port map (nI2,I3,G21);
    X1: dual_XOR port map (G20,G21,F1);

    C34: dual_AND port map (I2,nM,G22);
    C35: triple_AND port map (nM,I0,I3,G23);
    C36: quad_AND port map (nM,I1,Cin,I3,G24);
    C37: triple_NOR port map (G22,G23,G24,G25);
    K4: INV port map(I4,nI4);
    C38: dual_AND port map (nI4,I5,G26);
    X2: dual_XOR port map(G25,G26,F2);

    C39: dual_AND port map(nM,I4,G27);
    C40: triple_AND port map (nM,I2,I5,G28);
    C41: quad_AND port map (nM,I0,I3,I5,G29);
    C42: pent_AND port map (nM,Cin,I1,I3,I5,G30);
    C43: quad_NOR port map(G27,G28,G28,G30,G31);
    K5: INV port map (I6,nI6);
    C44: dual_AND port map (nI6,I7,G32);
    X3: dual_XOR port map(G31,G32,F3);
    XA5: quad_AND port map (F0,F1,F2,F3,AEB);

    C45: pent_AND port map (Cin,I1,I3,I5,I7,G33);
    K6: INV port map(G33,nG33);
    C46: quad_AND port map (I0,I3,I5,I7 G34);
    C47: triple_AND port map(I2,I5,I7,G35);
    C48: dual_AND port map (I4,I7,G36);
    C49: quad_NOR port map (G34,G35,G36,I6,G37);
    XA6: dual_AND port map(nG33,G37,Cout);
  end architecture;
