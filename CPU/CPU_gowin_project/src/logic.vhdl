--basic logic components of the ALU
library ieee;
use ieee.std_logic_1164.all;

entity INV is
  port (A: in std_logic;
  F: out std_logic);
end INV;

architecture INV_beh of INV is
begin
    F <= not A;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity dual_AND is
  port (A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_AND;

architecture dual_AND_beh of dual_AND is
begin
    F <= A and B;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity triple_AND is
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  F: out std_logic);
end triple_AND;

architecture triple_AND_beh of triple_AND is
begin
    F <= A and B and C;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity quad_AND is
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  F: out std_logic);
end quad_AND;

architecture quad_AND_beh of quad_AND is
begin
    F <= A and B and C and D;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity pent_AND is
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  E: in std_logic;
  F: out std_logic);
end pent_AND;

architecture pent_AND_beh of pent_AND is
begin
    F <= A and B and C and D and E;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity dual_XOR is
  port(A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_XOR;

architecture dual_XOR_beh of dual_XOR is
begin
  F <= A xor B;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity dual_NOR is
  port(A: in std_logic;
  B: in std_logic;
  F: out std_logic);
end dual_NOR;

architecture dual_NOR_beh of dual_NOR is
begin
  F <= A nor B;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity triple_NOR is
  port(A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  F: out std_logic);
end triple_NOR;

architecture triple_NOR_beh of triple_NOR is
begin
  F <= ((not A) and (not B) and (not C));
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity quad_NOR is
  port(A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  F: out std_logic);
end quad_NOR;

architecture quad_NOR_beh of quad_NOR is
begin
  F <= ((not A) and (not B) and (not C) and (not D));
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity BUF is
  port(A: in std_logic;
  F: out std_logic);
end BUF;

architecture BUF_beh of BUF is
begin
  F <= A;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity TRI_BUF is
  port(A: in std_logic;
  E: in std_logic;
  F: out std_logic);
end TRI_BUF;

architecture TRI_BUF_beh of TRI_BUF is
begin
  F <= A when (E = '1') else 'Z';
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity BUS_TRANSCIEVER is
  port (d: in std_logic_vector (7 downto 0);
        EN: in std_logic; -- ENABLE.
        q: out std_logic_vector (7 downto 0));
end BUS_TRANSCIEVER;

architecture BUS_TRANSCIEVER_beh of BUS_TRANSCIEVER is
begin
q <= d when (EN ='1') else "ZZZZZZZZ";

end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity BUS_TRANSCIEVER4 is
  port (d0: in std_logic;
        d1: in std_logic;
        d2: in std_logic;
        d3: in std_logic;
        EN: in std_logic; -- ENABLE.
        q0: out std_logic;
        q1: out std_logic;
        q2: out std_logic;
        q3: out std_logic);
end BUS_TRANSCIEVER4;

architecture BUS_TRANSCIEVER4_beh of BUS_TRANSCIEVER4 is
begin
q0 <= d0 when (EN ='1') else 'Z';
q1 <= d1 when (EN ='1') else 'Z';
q2 <= d2 when (EN ='1') else 'Z';
q3 <= d3 when (EN ='1') else 'Z';
end architecture;
