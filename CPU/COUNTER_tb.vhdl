library ieee;
use ieee.std_logic_1164.all;

entity COUNTER_tb is
end entity;

architecture COUNTER_tb_test of COUNTER_tb is
component COUNTER
port(d: in std_logic_vector (7 downto 0);
      q: out std_logic_vector (7 downto 0):="00000000";
     clk: in std_logic;
     C_EN: in std_logic;
     J_EN: in std_logic);

end component;
signal clk,C_EN,J_EN:std_logic;
signal d,q :std_logic_vector(7 downto 0);
begin
mapping: COUNTER port map (d,q,clk,C_EN,J_EN);
process begin
d(0)<='1';
d(1)<='1';
d(2)<='1';
d(3)<='1';
d(4)<='1';
d(5)<='1';
d(6)<='1';
d(7)<='1';
J_EN <='1';
C_EN <= '0';
clk <= '0';
wait for 1 ns;
clk <='1';
wait for 1 ns;
J_EN <='0';
C_EN <='1';
clk<='0';
wait for 1 ns;
clk <='1';
wait for 1 ns;
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
clk<='0';
wait for 1 ns;
clk<='1';
wait for 1 ns;
clk<='0';
C_EN <='0';
J_EN <='1';
d(0)<='0';
d(1)<='0';
d(2)<='0';
d(3)<='1';
d(4)<='0';
d(5)<='1';
d(6)<='0';
d(7)<='1';
wait for 1 ns;
clk<='1';
wait for 1 ns;
assert false report "Yeet done";
wait;
end process;
end architecture;
