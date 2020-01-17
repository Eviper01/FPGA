library ieee;
use ieee.std_logic_1164.all;

entity CPU is
end CPU;

architecture CPU_arch of CPU is
  component ALU
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
end component;
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
  component COUNTER
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
  end component;
  signal COUNTERIN0,COUNTERIN1,COUNTERIN2,COUNTERIN3,COUNTERIN4,COUNTERIN5,COUNTERIN6,COUNTERIN7,C_EN,J_EN,Jwrite,COUNTER0,COUNTER1,COUNTER2,COUNTER3,COUNTER4,COUNTER5,COUNTER6,COUNTER7,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INSTRUCT5,INSTRUCT6,INSTRUCT7,Awrite,Bwrite,clk,INC,ALU_COUT,AEBL,AEBH,BI0,BI1,BI2,BI3,BI4,BI5,BI6,BI7,BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7, aRegO0,aRegO1,aRegO2,aRegO3,aRegO4,aRegO5,aRegO6,aRegO7, bRegO0,bRegO1,bRegO2,bRegO3,bRegO4,bRegO5,bRegO6,bRegO7: std_logic;
begin
  -- add enable AND gates for the A and B registers
  PRG_COUNTER: COUNTER port map(COUNTERIN0,COUNTERIN1,COUNTERIN2,COUNTERIN3,COUNTERIN4,COUNTERIN5,COUNTERIN6,COUNTERIN7,COUNTER0,COUNTER1,COUNTER2,COUNTER3,COUNTER4,COUNTER5,COUNTER6,COUNTER7,clk,C_EN,J_EN);
  Jump_Buffer: REG8 port map(BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,Jwrite,COUNTERIN0,COUNTERIN1,COUNTERIN2,COUNTERIN3,COUNTERIN4,COUNTERIN5,COUNTERIN6,COUNTERIN7);
  REG_BUS: REG8 port map(BI0,BI1,BI2,BI3,BI4,BI5,BI6,BI7,clk,BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7);
  REG_A: REG8 port map (BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,Awrite,aRegO0,aRegO1,aRegO2,aRegO3,aRegO4,aRegO5,aRegO6,aRegO7);
  REG_B: REG8 port map (BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,Bwrite,bRegO0,bRegO1,bRegO2,bRegO3,bRegO4,bRegO5,bRegO6,bRegO7);
  ALU0: ALU port map (aRegO0,aRegO1,aRegO2,aRegO3,bRegO0,bRegO1,bRegO2,bRegO3,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INSTRUCT5,BI0,BI1,BI2,BI3,INC,AEBL);
  ALU1: ALU port map (aRegO4,aRegO5,aRegO6,aRegO7,bRegO4,bRegO5,bRegO6,bRegO7,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INC,BI4,BI5,BI6,BI7,ALU_COUT,AEBH);
end architecture;
