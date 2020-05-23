library ieee;
use ieee.std_logic_1164.all;

entity REG8 is
  port (d: in std_logic_vector (7 downto 0):="00000000";
        clk: in std_logic; -- clock.
        q: out std_logic_vector (7 downto 0):="00000000");
end entity;

architecture REG8_beh of REG8 is

begin
  process(clk)
  begin
    if rising_edge(clk) then
      q <= d;
    end if;
    end process;
      end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity REG8_Stable is
    port (d: in std_logic_vector (7 downto 0):= "00000000";
          clk: in std_logic;
          q: out std_logic_vector (7 downto 0):= "00000000"
    );
end entity;

architecture REG8_Stable_beh of REG8_Stable is
shared variable cell: std_logic_vector(7 downto 0):="00000000";
begin
    process(clk)
    begin
      if (rising_edge(clk)) then
        cell := d;
        q<=cell;
      end if;
    end process;
end architecture;
