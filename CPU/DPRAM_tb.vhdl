library ieee;
use ieee.std_logic_1164.all;

entity DPRAM_tb is
end entity;


architecture DPRAM_tb_test of DPRAM_tb is
component DPRAM
port  (
    data_a	: in std_logic_vector(7 downto 0);
    data_b	: in std_logic_vector(7 downto 0);
    addr_a	: in std_logic_vector (8 downto 0);
		addr_b	: in std_logic_vector (8 downto 0);
    we_a	: in std_logic := '1';
    we_b	: in std_logic := '1';
    clk		: in std_logic;
    q_a		: out std_logic_vector(7 downto 0);
    q_b		: out std_logic_vector(7 downto 0)
  );

end component;
signal data_a, data_b,q_a,q_b : std_logic_vector(7 downto 0);
signal addr_a,addr_b: std_logic_vector (8 downto 0);
signal we_a, we_b, clk: std_logic;
begin
mapping: DPRAM port map (data_a,data_b,addr_a,addr_b,we_a,we_b,clk,q_a,q_b);
process begin
  clk<='0';
  we_b <='1';
  addr_b<="100000000";
  data_b<="00000001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="100000001";
  data_b<="00000110";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000000";
  data_b<="00010000";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000001";
  data_b<="10000000";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000010";
  data_b<="00010000";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000011";
  data_b<="10000001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000100";
  data_b<="00010001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000101";
  data_b<="10000110";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000110";
  data_b<="11001001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000000111";
  data_b<="10000011";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000001000";
  data_b<="11001001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000001001";
  data_b<="10000000";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000001010";
  data_b<="11001001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000001011";
  data_b<="10000011";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000001100";
  data_b<="11001001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000001101";
  data_b<="10000001";
  wait for 1 ns;
  clk<='1';

  wait for 1 ns;
  clk<='0';
  addr_b<="000001110";
  data_b<="10000010";
  wait for 1 ns;
  clk <='1';
  wait for 1 ns;
  we_b<='0';
  clk<='1';
  wait for 1 ns;
  clk <= '1';
  wait for 1 ns;
  clk <='0';
  wait for 1 ns;
  addr_b<="000000001";
  clk<='1';
  wait for 1 ns;
  clk<='0';

  wait for 1 ns;
  addr_b<="000000010";
  clk<='1';
  wait for 1 ns;
  clk<='0';

  wait for 1 ns;
  addr_b<="000000011";
  clk<='1';
  wait for 1 ns;
  clk<='0';

  wait for 1 ns;
  addr_b<="000000100";
  clk<='1';
  wait for 1 ns;
  clk<='0';

  wait for 1 ns;
  addr_b<="000000101";
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

  wait for 1 ns;
  clk<='1';
  wait for 1 ns;
  clk<='0';
  assert false report "Yeet done";
  wait;
end process;
end architecture;
