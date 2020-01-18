library ieee;
use ieee.std_logic_1164.all;

entity DPRAM_tb is
end entity;


architecture DPRAM_tb_test of DPRAM_tb is
component DPRAM
port  (
    data_a	: in std_logic_vector(7 downto 0);
    data_b	: in std_logic_vector(7 downto 0);
    addr_a	: in natural range 0 to 511;
    addr_b	: in natural range 0 to 511;
    we_a	: in std_logic := '1';
    we_b	: in std_logic := '1';
    clk		: in std_logic;
    q_a		: out std_logic_vector(7 downto 0);
    q_b		: out std_logic_vector(7 downto 0)
  );

end component;
signal data_a, data_b,q_a,q_b : std_logic_vector(7 downto 0);
signal addr_a,addr_b: natural range 0 to 511;
signal we_a, we_b, clk: std_logic;
begin
mapping: DPRAM port map (data_a,data_b,addr_a,addr_b,we_a,we_b,clk,q_a,q_b);
process begin
  data_a (7 downto 0) <= "00000010";
  addr_a <= 300;
  we_a <= '1';
  clk <='0';
  wait for 1 ns;
  clk <='1';
  wait for 1 ns;
  clk <= '0';
  data_a (7 downto 0) <= "11111111";
  addr_a <= 301;
  wait for 1 ns;
  clk <='1';
  wait for 1 ns;
  we_a <= '0';
  addr_a  <= 300;
  clk <= '0';
  wait for 1 ns;
  clk <='1';
  wait for 1 ns;
  clk <='0';
  wait for 1 ns;
  addr_a <= 301;
  clk <= '1';
  wait for 1 ns;
  assert false report "Yeet done";
  wait;
end process;
end architecture;
