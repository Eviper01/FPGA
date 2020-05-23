library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity MRAM is
  port(
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
end MRAM;

architecture rtl of MRAM is

	-- Build a 2-D array type for the RAM
	subtype word_t is std_logic_vector(7 downto 0);
	type memory_t is array(511 downto 0) of word_t;

	-- Declare the RAM
	shared variable ram : memory_t;

begin
 q_a <= ram(to_integer(unsigned(addr_a)));
 q_b <= ram(to_integer(unsigned(addr_b)));

	-- Port A
  process(clk)
  begin
    if(rising_edge(clk)) then
      if(we_a = '1') then
        ram(to_integer(unsigned(addr_a))) := data_a;
      end if;
    end if;
  end process;


	-- Port B
  process(clk)
  begin
    if(rising_edge(clk)) then
      if(we_b = '1') then
        ram(to_integer(unsigned(addr_b))) := data_b;
      end if;
    end if;
  end process;

end rtl;
