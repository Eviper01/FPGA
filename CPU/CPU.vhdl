library ieee;
use ieee.std_logic_1164.all;

entity CPU is
  port(
      byte_out: out std_logic_vector (7 downto 0);

       clk: in std_logic; -- this isnt necessary once the internal clock is configured
       debug_interface_addr: in std_logic_vector (8 downto 0);
       debug_interface_data: in std_logic_vector (7 downto 0);
       debug_control: in std_logic --when this high need to disconnect the counter and the instruction output and set we_b to high
       );

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
  port (d: in std_logic_vector (7 downto 0):="00000000";
        clk: in std_logic; -- clock.
        q: out std_logic_vector (7 downto 0):="00000000");
  end component;
  component COUNTER
  port(d: in std_logic_vector (7 downto 0);
        q: out std_logic_vector (7 downto 0):="00000000";
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
  component BUS_TRANSCIEVER
  port (d0: in std_logic;
        d1: in std_logic;
        d2: in std_logic;
        d3: in std_logic;
        d4: in std_logic;
        d5: in std_logic;
        d6: in std_logic;
        d7: in std_logic;
        EN: in std_logic; -- ENABLE.
        q0: out std_logic;
        q1: out std_logic;
        q2: out std_logic;
        q3: out std_logic;
        q4: out std_logic;
        q5: out std_logic;
        q6: out std_logic;
        q7: out std_logic);
  end component;
  component dual_AND
  port (A: in std_logic;
  B: in std_logic;
  F: out std_logic);
  end component;
  component dual_NOR
  port (A: in std_logic;
  B: in std_logic;
  F: out std_logic);
  end component;
  component triple_AND
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  F: out std_logic);
  end component;
  component triple_NOR
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  F: out std_logic);
  end component;
  component quad_AND
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  F: out std_logic);
  end component;
  component quad_NOR
  port (A: in std_logic;
  B: in std_logic;
  C: in std_logic;
  D: in std_logic;
  F: out std_logic);
  end component;
  component INV
  port(A: in std_logic;
  F: out std_logic);
  end component;
  signal Owrite,C_EN,J_EN,Jwrite,COUNTER0,COUNTER1,COUNTER2,COUNTER3,COUNTER4,COUNTER5,COUNTER6,COUNTER7,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INSTRUCT5,INSTRUCT6,INSTRUCT7,Awrite,Bwrite,INC,ALU_COUT,AEBL,AEBH,RAM_write_en,ADDR_WRITE,ALU_OUT0,ALU_OUT1,ALU_OUT2,ALU_OUT3,ALU_OUT4,ALU_OUT5,ALU_OUT6,ALU_OUT7,ALU_EN,B_EN,FLAG_C,FLAG_EL,FLAG_EH,RAM_EN,MNIGO,RAM_NIB_addr,MNOGO,nMiGO,RAM_BYTE_addr,MBIGO,MBOGO,nRAM_EN: std_logic;
  signal RAM_addr,RAM_data,BI,BO,COUNTERIN,aREGO,bREGO,unused: std_logic_vector (7 downto 0);
  signal LI0,LI1,LI2,LI3,LI4,LI5,LI6,LI7,LI8,LI9,LI10,LI11,LI12,LI13,LI14,LI15,LI16,LI17,nINSTRUCT4,nINSTRUCT5,nNBLGO,NBLGO:std_logic;
  --debugging signals
  signal INSTRUCT_pre0,INSTRUCT_pre1,INSTRUCT_pre2,INSTRUCT_pre3,INSTRUCT_pre4,INSTRUCT_pre5,INSTRUCT_pre6,INSTRUCT_pre7,ndebug:std_logic;
  signal COUNTER_pre: std_logic_vector(7 downto 0);
begin
  --ensure bus has transcievers connected to prevent internal shorts
  PRG_COUNTER: COUNTER port map(COUNTERIN,COUNTER_pre,clk,C_EN,J_EN);
  Jump_Buffer: REG8 port map(BO,Jwrite,COUNTERIN);
  REG_BUS: REG8 port map(BI,clk,BO);
  REG_A: REG8 port map (BO,Awrite,aREGO);
  REG_B: REG8 port map (BO,Bwrite,bRegO);
  REG_O: REG8 port map (BO,Owrite,byte_out);
  ALU0: ALU port map (aREGO(0),aREGO(1),aREGO(2),aREGO(3),bREGO(0),bREGO(1),bREGO(2),bREGO(3),INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INSTRUCT5,ALU_OUT0,ALU_OUT1,ALU_OUT2,ALU_OUT3,INC,AEBL);
  ALU1: ALU port map (aREGO(4),aREGO(5),aREGO(6),aREGO(7),bREGO(4),bREGO(5),bREGO(6),bREGO(7),INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INC,ALU_OUT4,ALU_OUT5,ALU_OUT6,ALU_OUT7,ALU_COUT,AEBH);
  --the way this ram is clocked is kinda funky
  RAM_Transciever: BUS_TRANSCIEVER port map(RAM_data(0),RAM_data(1),RAM_data(2),RAM_data(3),RAM_data(4),RAM_data(5),RAM_data(6),RAM_data(7),RAM_EN,BI(0),BI(1),BI(2),BI(3),BI(4),BI(5),BI(6),BI(7));
  RAM: DPRAM port map (data_a=>BO, data_b => debug_interface_data ,addr_a(7 downto 0)=>RAM_addr,addr_a(8)=>'1',addr_b(0)=>COUNTER0,addr_b(1)=>COUNTER1,addr_b(2)=>COUNTER2,addr_b(3)=>COUNTER3,addr_b(4)=>COUNTER4,addr_b(5)=>COUNTER5,addr_b(6)=>COUNTER6,addr_b(7)=>COUNTER7,addr_b(8)=>debug_interface_addr(8),we_a=>RAM_write_en,we_b => debug_control,clk => clk,q_a => RAM_data,q_b(0)=> INSTRUCT_pre0,q_b(1)=> INSTRUCT_pre1,q_b(2)=>INSTRUCT_pre2,q_b(3)=> INSTRUCT_pre3,q_b(4)=>INSTRUCT_pre4,q_b(5)=>INSTRUCT_pre5,q_b(6)=>INSTRUCT_pre6,q_b(7)=>INSTRUCT_pre7);
  ALU_Transciever:BUS_TRANSCIEVER port map (ALU_OUT0,ALU_OUT1,ALU_OUT2,ALU_OUT3,ALU_OUT4,ALU_OUT5,ALU_OUT6,ALU_OUT7,ALU_EN,BI(0),BI(1),BI(2),BI(3),BI(4),BI(5),BI(6),BI(7));
  ALU_DECODER:dual_AND port map(INSTRUCT7,INSTRUCT6,ALU_EN);
  A_IN_DEC0: quad_NOR port map(INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,LI0);
  A_IN_DEC1: triple_NOR port map(INSTRUCT4,INSTRUCT5,INSTRUCT6,LI1); --- this is extra special
  A_IN_DEC2: quad_AND port map(LI1,LI0,INSTRUCT7,clk,Awrite);
  B_IN_DEC0: triple_NOR port map(INSTRUCT1,INSTRUCT2,INSTRUCT3,LI2);
  B_IN_DEC2: quad_AND port map(INSTRUCT7,INSTRUCT0,LI2,LI1,B_EN);
  B_IN_DEC3: dual_AND port map(B_EN,clk,Bwrite);
  O_IN_DEC0: triple_AND port map (INSTRUCT0,INSTRUCT1,INSTRUCT7,LI4);
  O_IN_DEC1: dual_NOR port map (INSTRUCT2,INSTRUCT3,LI5);
  O_IN_DEC2: triple_NOR port map(INSTRUCT6,INSTRUCT5,INSTRUCT4,LI6);
  O_IN_DEC3: quad_AND port map (LI4,LI5,LI6,clk,Owrite);
  JB_IN_DEC0: triple_AND port map (INSTRUCT1,INSTRUCT2,INSTRUCT7,LI7);
  JB_IN_DEC1: dual_NOR port map (INSTRUCT0,INSTRUCT3,LI8);
  JB_IN_DEC3: quad_AND port map (LI7,LI8,LI1,clk,Jwrite);
  FLAGS: REG8 port map(d(0)=>ALU_COUT,d(1)=>AEBL,d(2)=>AEBH,d(7 downto 3)=>unused(7 downto 3),clk=>clk,q(0)=>FLAG_C,q(1)=>FLAG_EL,q(2)=>FLAG_EH,q(7 downto 3)=>unused(7 downto 3));
  JMP_DEC0: triple_NOR port map (INSTRUCT0,INSTRUCT2,INSTRUCT3,LI3);
  JMP_DEC1: dual_AND port map (INSTRUCT7,INSTRUCT1,LI9);
  JMP_DEC2: triple_AND port map (LI3,LI1,LI9,LI13);
  JMP_OR0: triple_NOR port map (LI12,LI13,LI14,C_EN);
  JMP_OR1: INV port map (C_EN,J_EN);
  JMP_C_DEC0: triple_NOR port map (INSTRUCT0,INSTRUCT1,INSTRUCT3,LI11);
  JMP_C_DEC1: quad_AND port map (LI1,LI11,INSTRUCT2,INSTRUCT7,LI15);
  JMP_C_DEC2: dual_AND port map (LI15,FLAG_C,LI12);
  JMP_E_DEC0: dual_NOR port map (INSTRUCT1,INSTRUCT3,LI16);
  JMP_E_DEC1: quad_AND port map (LI1,LI16,INSTRUCT0,INSTRUCT2,LI17);
  JMP_E_DEC2: quad_AND port map (LI17,INSTRUCT7,FLAG_EH,FLAG_EL,LI14);

  --ram decoding
  MEM_NBL_IN_DEC0: INV port map (INSTRUCT4,nINSTRUCT4);
  MEM_NBL_IN_DEC1: quad_NOR port map (nINSTRUCT4,INSTRUCT5,INSTRUCT6,INSTRUCT7,MNIGO);
  MEM_NBL0: dual_NOR port map(MNIGO,MNOGO,nNBLGO);
  MEM_NBL1: INV port map (nNBLGO,RAM_NIB_addr);
  MEM_NBL_OUT_DEC0: INV port map (INSTRUCT5, nINSTRUCT5);
  MEM_NBL_OUT_DEC1: quad_NOR port map(INSTRUCT4,nINSTRUCT5,INSTRUCT6,INSTRUCT7,MNOGO);
  WRITE_ENABLER0: dual_NOR port map (MNIGO,MBIGO,nMIGO);
  WRITE_ENABLER1: INV port map(nMIGO,RAM_write_en);
  READ_ENABLER0: dual_NOR port map(MNOGO,MBOGO,nRAM_EN);
  READ_ENABLER1: INV port map(nRAM_EN,RAM_EN);
  Literal_Addr_Buffer: BUS_TRANSCIEVER port map (INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,'0','0','0','0',RAM_NIB_addr,RAM_addr(0),RAM_addr(1),RAM_addr(2),RAM_addr(3),RAM_addr(4),RAM_addr(5),RAM_addr(6),RAM_addr(7));
  RAM_addr_Transciever: BUS_TRANSCIEVER port map (BO(0),BO(1),BO(2),BO(3),BO(4),BO(5),BO(6),BO(7),RAM_BYTE_addr,RAM_addr(0),RAM_addr(1),RAM_addr(2),RAM_addr(3),RAM_addr(4),RAM_addr(5),RAM_addr(6),RAM_addr(7));
  --program upload interface
  debug_buffer0: BUS_TRANSCIEVER port map(counter_pre(0),counter_pre(1),counter_pre(2),counter_pre(3),counter_pre(4),counter_pre(5),counter_pre(6),counter_pre(7),ndebug,COUNTER0,COUNTER1,COUNTER2,COUNTER3,COUNTER4,COUNTER5,COUNTER6,COUNTER7);
  debug_buffer1: BUS_TRANSCIEVER port map(INSTRUCT_pre0,INSTRUCT_pre1,INSTRUCT_pre2,INSTRUCT_pre3,INSTRUCT_pre4,INSTRUCT_pre5,INSTRUCT_pre6,INSTRUCT_pre7,ndebug,INSTRUCT0,INSTRUCT1,INSTRUCT2,INSTRUCT3,INSTRUCT4,INSTRUCT5,INSTRUCT6,INSTRUCT7);
  debugL0: INV port map(debug_control,ndebug);
  debug_bufferS: BUS_TRANSCIEVER port map (debug_interface_addr(0),debug_interface_addr(1),debug_interface_addr(2),debug_interface_addr(3),debug_interface_addr(4),debug_interface_addr(5),debug_interface_addr(6),debug_interface_addr(7),debug_control,COUNTER0,COUNTER1,COUNTER2,COUNTER3,COUNTER4,COUNTER5,COUNTER6,COUNTER7);
  MBIGO <='0';
  MBOGO <='0';
  RAM_BYTE_addr <='0';
end architecture;
