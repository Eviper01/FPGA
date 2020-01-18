library ieee;
use ieee.std_logic_1164.all;

entity CPU is
  port(byte_out0: out std_logic;
       byte_out1: out std_logic;
       byte_out2: out std_logic;
       byte_out3: out std_logic;
       byte_out4: out std_logic;
       byte_out5: out std_logic;
       byte_out6: out std_logic;
       byte_out7: out std_logic);

end CPU;

architecture CPU_arch of CPU is
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
  component REG8
  port (d0: in std_logic;
        d1: in std_logic;
        d2: in std_logic;
        d3: in std_logic;
        d4: in std_logic;
        d5: in std_logic;
        d6: in std_logic;
        d7: in std_logic;
        clk: in std_logic; -- clock.
        q0: out std_logic;
        q1: out std_logic;
        q2: out std_logic;
        q3: out std_logic;
        q4: out std_logic;
        q5: out std_logic;
        q6: out std_logic;
        q7: out std_logic);
  end component;
  component COUNTER
  port(d0: in std_logic;
       d1: in std_logic;
       d2: in std_logic;
       d3: in std_logic;
       d4: in std_logic;
       d5: in std_logic;
       d6: in std_logic;
       d7: in std_logic;
       q0: out std_logic;
       q1: out std_logic;
       q2: out std_logic;
       q3: out std_logic;
       q4: out std_logic;
       q5: out std_logic;
       q6: out std_logic;
       q7: out std_logic;
       clk: in std_logic;
       C_EN: in std_logic;
       J_EN: in std_logic);
  end component;
  component DPRAM
  port
  (
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
  signal Owrite,COUNTERIN0,COUNTERIN1,COUNTERIN2,COUNTERIN3,COUNTERIN4,COUNTERIN5,COUNTERIN6,COUNTERIN7,C_EN,J_EN,Jwrite,COUNTER0,COUNTER1,COUNTER2,COUNTER3,COUNTER4,COUNTER5,COUNTER6,COUNTER7,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INSTRUCT5,INSTRUCT6,INSTRUCT7,Awrite,Bwrite,clk,INC,ALU_COUT,AEBL,AEBH,BI0,BI1,BI2,BI3,BI4,BI5,BI6,BI7,BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7, aRegO0,aRegO1,aRegO2,aRegO3,aRegO4,aRegO5,aRegO6,aRegO7, bRegO0,bRegO1,bRegO2,bRegO3,bRegO4,bRegO5,bRegO6,bRegO7,RAM_write_en,ADDR_WRITE: std_logic;
  signal RAM_addr: std_logic_vector (7 downto 0);
begin
  -- add enable AND gates for the A and B registers
  PRG_COUNTER: COUNTER port map(COUNTERIN0,COUNTERIN1,COUNTERIN2,COUNTERIN3,COUNTERIN4,COUNTERIN5,COUNTERIN6,COUNTERIN7,COUNTER0,COUNTER1,COUNTER2,COUNTER3,COUNTER4,COUNTER5,COUNTER6,COUNTER7,clk,C_EN,J_EN);
  Jump_Buffer: REG8 port map(BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,Jwrite,COUNTERIN0,COUNTERIN1,COUNTERIN2,COUNTERIN3,COUNTERIN4,COUNTERIN5,COUNTERIN6,COUNTERIN7);
  REG_BUS: REG8 port map(BI0,BI1,BI2,BI3,BI4,BI5,BI6,BI7,clk,BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7);
  REG_A: REG8 port map (BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,Awrite,aRegO0,aRegO1,aRegO2,aRegO3,aRegO4,aRegO5,aRegO6,aRegO7);
  REG_B: REG8 port map (BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,Bwrite,bRegO0,bRegO1,bRegO2,bRegO3,bRegO4,bRegO5,bRegO6,bRegO7);
  REG_O: REG8 port map (BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,Owrite,byte_out0,byte_out1,byte_out2,byte_out3,byte_out4,byte_out5,byte_out6,byte_out7);
  ALU0: ALU port map (aRegO0,aRegO1,aRegO2,aRegO3,bRegO0,bRegO1,bRegO2,bRegO3,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INSTRUCT5,BI0,BI1,BI2,BI3,INC,AEBL);
  ALU1: ALU port map (aRegO4,aRegO5,aRegO6,aRegO7,bRegO4,bRegO5,bRegO6,bRegO7,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INC,BI4,BI5,BI6,BI7,ALU_COUT,AEBH);
  ADDR_REG: REG8 port map(BO0,BO1,BO2,BO3,BO4,BO5,BO6,BO7,ADDR_WRITE,RAM_addr(0),RAM_addr(1),RAM_addr(2),RAM_addr(3),RAM_addr(4),RAM_addr(5),RAM_addr(6),RAM_addr(7));
  --the way this ram is clocked is kinda funky
  RAM: DPRAM port map (data_a(0) => BO0, data_a(1) => BO1, data_a(2) => BO2, data_a(3) => BO3, data_a(4) => BO4, data_a(5) => BO5, data_a(6) => BO6, data_a(7) => BO7, data_b => "ZZZZZZZZ" ,addr_a(7 downto 0)=>RAM_addr,addr_a(8)=>'1',addr_b(0)=>COUNTER0,addr_b(1)=>COUNTER1,addr_b(2)=>COUNTER2,addr_b(3)=>COUNTER3,addr_b(4)=>COUNTER4,addr_b(5)=>COUNTER5,addr_b(6)=>COUNTER6,addr_b(7)=>COUNTER7,addr_b(8)=>'0',we_a=>RAM_write_en,we_b => '0',clk => clk,q_a(0)=>BI0,q_a(1)=>BI1,q_a(2)=>BI2,q_a(3)=>BI3,q_a(4)=>BI4,q_a(5)=>BI5,q_a(6)=>BI6,q_a(7)=>BI7,q_b(0)=> INSTRUCT0,q_b(1)=> INSTRUCT1,q_b(2)=>INSTRUCT2,q_b(3)=> INSTRUCT3,q_b(4)=>INSTRUCT4,q_b(5)=>INSTRUCT5,q_b(6)=>INSTRUCT6,q_b(7)=>INSTRUCT7);

end architecture;
