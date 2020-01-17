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
  signal BU0,BU1,BU2,BU3,BU4,BU5,BU6,BU7,BI0,BI1,BI2,BI3,BI4,BI5,BI6,BI7, aRegO0,aRegO1,aRegO2,aRegO3,aRegO4,aRegO5,aRegO6,aRegO7, bRegO0,bRegO1,bRegO2,bRegO3,bRegO4,bRegO5,bRegO6,bRegO7;

begin
  ALU0: ALU port map (aRegO0,aRegO1,aRegO2,aRegO3,bRegO0,bRegO1,bRegO2,bRegO3);
  ALU1: ALU port map (aRegO4,aRegO5,aRegO6,aRegO7,bRegO4,bRegO5,bRegO6,bRegO7);
end architecture;
