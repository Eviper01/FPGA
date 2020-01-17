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
