library ieee;
use ieee.std_logic_1164.all;

--basic logic components of the ALU
entity INV is
  port (A: in std_logic;
  F: out std_logic);
end INV;

architecture INV_beh of INV is
begin
    F <= not A;
end architecture;

entity dual_AND is
  port (A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_AND;

architecture dual_AND_beh of dual_AND is
begin
    F <= A and B;
end architecture;

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

entity dual_XOR is
  port(A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_XOR;

architecture dual_XOR_beh of dual_XOR is
begin
  F <= A xor B;
end architecture;

entity dual_NOR is
  port(A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_NOR;

architecture dual_NOR_beh of dual_NOR is
begin
  F <= A nor B;
end architecture;

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
      CoutL: out std_logic;
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
--n is used to designate an output from an inverter, G is used to designate an and gate outpt , I is used to designate an nor gate output, X is used to desigante an xor gate output
  signal nB0,nB1,nB2,nB3,I0,I1,I2,I3,I4,I5,I6,I7,G0,G1,G2,G3,G4,G5,G6,G7,G8,G9,G10,G11,G12,G13,G14,G15,G16,G17,G18,G19: std_logic
  begin
    -- c is used to desginate a components port map
    C4: dual_AND port map (B0, S0, G0);
    C0: INV port map (B0, nB0);
    C5: dual_AND port map (nB0, S1, G1);
  end architecture;
