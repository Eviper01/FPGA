

library ieee;
use ieee.std_logic_1164.all;


entity ALU_tb is
end ALU_tb;

architecture test of ALU_tb is
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
signal A0,A1,A2,A3,B0,B1,B2,B3,S0,S1,S2,S3,M,Cin,F0,F1,F2,F3,Cout,AEB:std_logic;
begin
	mapping: ALU port map (A0,A1,A2,A3,B0,B1,B2,B3,S0,S1,S2,S3,M,Cin,F0,F1,F2,F3,Cout,AEB);
	process begin
	A0 <= '1';
  A1 <= '1';
  A2 <= '1';
  A3 <= '1';

  B0 <= '1';
  B1 <= '0';
  B2 <= '0';
  B3 <= '0';

  Cin <= '1';
  M <= '0';
  S0 <= '1';
  S1 <= '0';
  S2 <= '0';
  S3 <= '1';
	wait for 1 ns;
	assert false report "Yeet done";
	wait;
end process;
end test;
