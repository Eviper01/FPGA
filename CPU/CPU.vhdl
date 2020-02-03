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
  A: in std_logic_vector (3 downto 0);
  B: in std_logic_vector (3 downto 0);
  S: in std_logic_vector (3 downto 0);
  M:  in std_logic;
  Cin: in std_logic;
  F: out std_logic_vector (3 downto 0);
  Cout: out std_logic;
  AEB: out std_logic);
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
  component MRAM
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
  port (d: in std_logic_vector (7 downto 0);
        EN: in std_logic; -- ENABLE.
        q: out std_logic_vector (7 downto 0));
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
  component TRI_BUF
  port(A: in std_logic;
  E: in std_logic;
  F: out std_logic);
  end component;
  signal Owrite,C_EN,J_EN,Jwrite,Awrite,Bwrite,INC,ALU_COUT,AEBL,AEBH,RAM_write_en,ADDR_WRITE,ALU_EN,B_EN,FLAG_C,FLAG_EL,FLAG_EH,RAM_EN,MNIGO,RAM_NIB_addr,MNOGO,nMiGO,RAM_BYTE_addr,MBIGO,MBOGO,nRAM_EN: std_logic;
  signal RAM_addr,RAM_data,BI,BO,COUNTERIN,aREGO,bREGO,ALU_OUT,INSTRUCT,STEP,unused: std_logic_vector (7 downto 0);
  signal LI0,LI1,LI2,LI3,LI4,LI5,LI6,LI7,LI8,LI9,LI10,LI11,LI12,LI13,LI14,LI15,LI16,LI17,nINSTRUCT4,nINSTRUCT5,nNBLGO,NBLGO,BufCLK:std_logic;
  --debugging signals
  signal ndebug:std_logic;
  signal COUNTER_pre,INSTRUCT_pre: std_logic_vector(7 downto 0);
begin
  --ensure bus has transcievers connected to prevent internal shorts
  PRG_COUNTER: COUNTER port map(COUNTERIN,COUNTER_pre,BufCLK,C_EN,J_EN);
  Jump_Buffer: REG8 port map(BO,Jwrite,COUNTERIN);
  REG_BUS: REG8 port map(BI,clk,BO);
  REG_A: REG8 port map (BO,Awrite,aREGO);
  REG_B: REG8 port map (BO,Bwrite,bRegO);
  REG_O: REG8 port map (BO,Owrite,byte_out);
  ALU0: ALU port map (aREGO(3 downto 0),bREGO(3 downto 0),INSTRUCT(3 downto 0),INSTRUCT(4),INSTRUCT(5),ALU_OUT(3 downto 0),INC,AEBL);
  ALU2: ALU port map (aREGO(7 downto 4),bREGO(7 downto 4),INSTRUCT(3 downto 0),INSTRUCT(4),INC,ALU_OUT(7 downto 4),ALU_COUT,AEBH);
  --the way this ram is clocked is kinda funky
  RAM_Transciever: BUS_TRANSCIEVER port map(RAM_data,RAM_EN,BI);
  RAM: MRAM port map (data_a=>BO, data_b => debug_interface_data ,addr_a(7 downto 0)=>RAM_addr,addr_a(8)=>'1',addr_b(7 downto 0)=>STEP,addr_b(8)=>debug_interface_addr(8),we_a=>RAM_write_en,we_b => debug_control,clk => clk,q_a => RAM_data,q_b=>INSTRUCT_pre);
  ALU_Transciever:BUS_TRANSCIEVER port map (ALU_OUT,ALU_EN,BI);
  ALU_DECODER:dual_AND port map(INSTRUCT(7),INSTRUCT(6),ALU_EN);
  A_IN_DEC0: quad_NOR port map(INSTRUCT(0),INSTRUCT(1),INSTRUCT(2),INSTRUCT(3),LI0);
  A_IN_DEC1: triple_NOR port map(INSTRUCT(4),INSTRUCT(5),INSTRUCT(6),LI1); --- this is extra special
  A_IN_DEC2: quad_AND port map(LI1,LI0,INSTRUCT(7),clk,Awrite);
  B_IN_DEC0: triple_NOR port map(INSTRUCT(1),INSTRUCT(2),INSTRUCT(3),LI2);
  B_IN_DEC2: quad_AND port map(INSTRUCT(7),INSTRUCT(0),LI2,LI1,B_EN);
  B_IN_DEC3: dual_AND port map(B_EN,clk,Bwrite);
  O_IN_DEC0: triple_AND port map (INSTRUCT(0),INSTRUCT(1),INSTRUCT(7),LI4);
  O_IN_DEC1: dual_NOR port map (INSTRUCT(2),INSTRUCT(3),LI5);
  O_IN_DEC2: triple_NOR port map(INSTRUCT(6),INSTRUCT(5),INSTRUCT(4),LI6);
  O_IN_DEC3: quad_AND port map (LI4,LI5,LI6,clk,Owrite);
  JB_IN_DEC0: triple_AND port map (INSTRUCT(1),INSTRUCT(2),INSTRUCT(7),LI7);
  JB_IN_DEC1: dual_NOR port map (INSTRUCT(0),INSTRUCT(3),LI8);
  JB_IN_DEC3: quad_AND port map (LI7,LI8,LI1,clk,Jwrite);
  FLAGS: REG8 port map(d(0)=>ALU_COUT,d(1)=>AEBL,d(2)=>AEBH,d(7 downto 3)=>unused(7 downto 3),clk=>clk,q(0)=>FLAG_C,q(1)=>FLAG_EL,q(2)=>FLAG_EH,q(7 downto 3)=>unused(7 downto 3));
  JMP_DEC0: triple_NOR port map (INSTRUCT(0),INSTRUCT(2),INSTRUCT(3),LI3);
  JMP_DEC1: dual_AND port map (INSTRUCT(7),INSTRUCT(1),LI9);
  JMP_DEC2: triple_AND port map (LI3,LI1,LI9,LI13);
  JMP_OR0: triple_NOR port map (LI12,LI13,LI14,C_EN);
  JMP_OR1: INV port map (C_EN,J_EN);
  JMP_C_DEC0: triple_NOR port map (INSTRUCT(0),INSTRUCT(1),INSTRUCT(3),LI11);
  JMP_C_DEC1: quad_AND port map (LI1,LI11,INSTRUCT(2),INSTRUCT(7),LI15);
  JMP_C_DEC2: dual_AND port map (LI15,FLAG_C,LI12);
  JMP_E_DEC0: dual_NOR port map (INSTRUCT(1),INSTRUCT(3),LI16);
  JMP_E_DEC1: quad_AND port map (LI1,LI16,INSTRUCT(0),INSTRUCT(2),LI17);
  JMP_E_DEC2: quad_AND port map (LI17,INSTRUCT(7),FLAG_EH,FLAG_EL,LI14);

  --ram decoding
  MEM_NBL_IN_DEC0: INV port map (INSTRUCT(4),nINSTRUCT4);
  MEM_NBL_IN_DEC1: quad_NOR port map (nINSTRUCT4,INSTRUCT(5),INSTRUCT(6),INSTRUCT(7),MNIGO);
  MEM_NBL0: dual_NOR port map(MNIGO,MNOGO,nNBLGO);
  MEM_NBL1: INV port map (nNBLGO,RAM_NIB_addr);
  MEM_NBL_OUT_DEC0: INV port map (INSTRUCT(5), nINSTRUCT5);
  MEM_NBL_OUT_DEC1: quad_NOR port map(INSTRUCT(4),nINSTRUCT5,INSTRUCT(6),INSTRUCT(7),MNOGO);
  WRITE_ENABLER0: dual_NOR port map (MNIGO,MBIGO,nMIGO);
  WRITE_ENABLER1: INV port map(nMIGO,RAM_write_en);
  READ_ENABLER0: dual_NOR port map(MNOGO,MBOGO,nRAM_EN);
  READ_ENABLER1: INV port map(nRAM_EN,RAM_EN);
  Literal_Addr_Buffer: BUS_TRANSCIEVER port map (d(3 downto 0)=>INSTRUCT(3 downto 0),d(7 downto 4)=>"0000",EN=>RAM_NIB_addr,q=>RAM_addr);
  RAM_addr_Transciever: BUS_TRANSCIEVER port map (BO,RAM_BYTE_addr,RAM_addr);
  --program upload interface
  debug_buffer0: BUS_TRANSCIEVER port map(counter_pre,ndebug,STEP);
  debug_buffer1: BUS_TRANSCIEVER port map(INSTRUCT_pre,ndebug,INSTRUCT);
  debugL0: INV port map(debug_control,ndebug);
  debug_bufferS: BUS_TRANSCIEVER port map (debug_interface_addr (7 downto 0),debug_control,STEP);
  --internal control to avoid debugging conflitcs
  NOP_buffer: BUS_TRANSCIEVER port map ("00000000",debug_control,INSTRUCT);
  CLK_BUF: TRI_BUF port map(clk,ndebug,BufCLK);
  MBIGO <='0';
  MBOGO <='0';
  RAM_BYTE_addr <='0';
end architecture;
