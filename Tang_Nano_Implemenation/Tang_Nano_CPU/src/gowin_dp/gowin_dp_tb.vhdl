library ieee;
use ieee.std_logic_1164.all;

entity Gowin_DP_tb is
end entity;

architecture Gowin_DP_tb_test of Gowin_DP_tb is
component Gowin_DP
port (
    douta: out std_logic_vector(7 downto 0);
    doutb: out std_logic_vector(7 downto 0);
    clka: in std_logic;
    ocea: in std_logic;
    cea: in std_logic;
    reseta: in std_logic;
    wrea: in std_logic;
    clkb: in std_logic;
    oceb: in std_logic;
    ceb: in std_logic;
    resetb: in std_logic;
    wreb: in std_logic;
    ada: in std_logic_vector(8 downto 0);
    dina: in std_logic_vector(7 downto 0);
    adb: in std_logic_vector(8 downto 0);
    dinb: in std_logic_vector(7 downto 0)
);

end component;
signal clka,ocea,cea,reseta,wrea,clkb,oceb,ceb,resetb,wreb:std_logic;
signal douta,doutb,dina,dinb:std_logic_vector(7 downto 0);
signal ada,adb:std_logic_vector(8 downto 0);
begin
mapping: Gowin_DP port map (douta,doutb,clka,ocea,cea,reseta,wrea,clkb,oceb,ceb,resetb,wreb,ada,dina,adb,dinb);
process begin
  wreb <='1';
  oceb<='1';
  ceb<='1';
  resetb<='0';
  adb<="100000000";
  dinb<="00000001";
  clka<='0';
  clkb<='0';
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="100000001";
  dinb<="00000110";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000000";
  dinb<="00010000";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000001";
  dinb<="10000000";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000010";
  dinb<="00010000";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000011";
  dinb<="10000001";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000100";
  dinb<="00010001";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000101";
  dinb<="10000110";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000110";
  dinb<="11001001";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000000111";
  dinb<="10000011";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000001000";
  dinb<="11001001";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000001001";
  dinb<="10000000";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000001010";
  dinb<="11001001";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000001011";
  dinb<="10000011";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000001100";
  dinb<="11001001";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000001101";
  dinb<="10000001";
  wait for 1 ns;
  clka<='1';
  clkb<='1';

  wait for 1 ns;
  clka<='0';
  clkb<='0';
  adb<="000001110";
  dinb<="10000010";
  wait for 1 ns;
  wreb<='0';
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';
  wait for 1 ns;
  adb<="000000001";
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  adb<="000000010";
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  adb<="000000011";
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  adb<="000000100";
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  adb<="000000101";
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  wait for 1 ns;
  clka<='1';
  clkb<='1';
  wait for 1 ns;
  clka<='0';
  clkb<='0';

  assert false report "Yeet done";
  wait;
end process;
end architecture;
