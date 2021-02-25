library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Entity ALU is
  Port( CLK: in std_logic; --toggle
				Load: in std_logic_vector(5 downto 0);--swith pins
				Sel: in std_logic_vector(7 downto 0); --
				DMD, R: inout std_logic_vector(15 downto 0); -- no pins
    		PMD: in std_logic_vector(23 downto 0);
				AMF: in std_logic_vector(4 downto 0);
				CI: in std_logic;
        En: in std_logic_vector(3 downto 0);
   			AZ, AN, AC, AV, AS: out std_logic;
        display1: out std_logic_vector(6 downto 0);
        display2: out std_logic_vector(6 downto 0)
);
end ALU;

Architecture arch of ALU is
  Component TriStateBuffer16 is
    Port(Data : in std_logic_vector(15 downto 0);
      En : in std_logic;
      Outp : out std_logic_vector(15 downto 0));
  end Component TriStateBuffer16;

  Component Register16 is
    Port(Inp : in std_logic_vector(15 downto 0);
      Load, Clk : in std_logic;
      Outp : out std_logic_vector(15 downto 0)); 
  end Component Register16;

  Component Multiplexer16 is
    port(Inp1, Inp2 : in std_logic_vector(15 downto 0);
      Sel : in std_logic;
      Outp : out std_logic_vector(15 downto 0));    
  end Component Multiplexer16;
  
  Component ALUkernel is
    Port(X,Y : in std_logic_vector(15 downto 0);
      CI : in std_logic;
      AMF : in std_logic_vector(4 downto 0);
      CLK: in std_logic;
      R: out std_logic_vector(15 downto 0);
      AZ, AN, AC, AV, AS: out std_logic);
  end Component ALUkernel;
  
  Component Display is
    port(
        input:in std_logic_vector(3 downto 0);
        output1:out  std_logic_vector(6 downto 0)
    );
  end Component Display;
  
  signal s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s13,s14: std_logic_vector(15 downto 0);
begin
  Ax0: Register16 port map(DMD,LOAD(0),CLK,s1);
  Ax1: Register16 port map(DMD,LOAD(1),CLK,s2);
  Mux1: Multiplexer16 port map(s1,s2,Sel(1),s3);
  Mux2: Multiplexer16 port map(R,s3,Sel(2),s4);
  T0: TriStateBuffer16 port map(s3,EN(0),DMD);


  Mux0: Multiplexer16 port map(DMD,PMD(23 downto 8),SEL(0),s5);
  Ay0: Register16 port map(S5,LOAD(2),CLK,s6);
  Ay1: Register16 port map(S5,LOAD(3),CLK,s7);
  Mux3: Multiplexer16 port map(s6,s7,Sel(3),s8);
  T1: TriStateBuffer16 port map(s8,EN(1),DMD);

  Mux4: Multiplexer16 port map(s8,s9,Sel(4),s10);
  ALU: ALUkernel port map(s4,s10,CI,AMF,CLK,s11,AZ,AN,AC,AV,AS);
  AF: Register16 port map(s11,LOAD(4),CLK,s9);
  Mux5: Multiplexer16 port map(s11,DMD,SEL(5),s13);

  AR: Register16 port map(s13,LOAD(5),CLK,s14);
  T2: TriStateBuffer16 port map(s14,EN(2),DMD);
  T3: TriStateBuffer16 port map(s14,EN(3),R);
  d1: Display port map(s14(3 downto 0),display1);
  d2: Display port map(s14(7 downto 4),display2);
end;
