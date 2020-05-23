library ieee;
use ieee.std_logic_1164.all;

entity CPU_tb is
end entity;

architecture CPU_tb_test of CPU_tb is
component CPU
port(
    byte_out: out std_logic_vector (7 downto 0);
     clk: in std_logic -- this isnt necessary once the internal clock is configured
     );

end component;
signal clk,debug_control:std_logic;
signal debug_interface_addr: std_logic_vector (8 downto 0);
signal debug_interface_data,byte_out: std_logic_vector (7 downto 0);
begin
mapping: CPU port map (byte_out,clk,debug_interface_addr,debug_interface_data,debug_control);
process begin
    debug_control <= '1';
    clk<='0';
    debug_interface_addr<="100000000";
    debug_interface_data<="00000001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="100000001";
    debug_interface_data<="00000110";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000000";
    debug_interface_data<="00100000";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000001";
    debug_interface_data<="10000000";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000010";
    debug_interface_data<="00100000";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000011";
    debug_interface_data<="10000001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000100";
    debug_interface_data<="00100001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000101";
    debug_interface_data<="10000110";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000110";
    debug_interface_data<="11001001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000000111";
    debug_interface_data<="10000011";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000001000";
    debug_interface_data<="11001001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000001001";
    debug_interface_data<="10000000";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000001010";
    debug_interface_data<="11001001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000001011";
    debug_interface_data<="10000011";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000001100";
    debug_interface_data<="11001001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000001101";
    debug_interface_data<="10000001";
    wait for 1 ns;
    clk<='1';

    wait for 1 ns;
    clk<='0';
    debug_interface_addr<="000001110";
    debug_interface_data<="10000010";
    wait for 1 ns;
    clk <='1';
    wait for 1 ns;
    clk<='0';
    wait for 1 ns;
    debug_control <= '0';
    clk <= '1';
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

    wait for 1 ns;
    clk<='1';
    wait for 1 ns;
    clk<='0';

  assert false report "Yeet done";
  wait;
end process;
end architecture;
