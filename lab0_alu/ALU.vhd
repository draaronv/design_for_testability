library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is
    port(
        CLK:in std_logic;
        LOAD:in std_logic_vector(5 downto 0);
        SEL:in std_logic_vector(7 downto 0);
        DMD:inout std_logic_vector(15 downto 0);
        R:inout std_logic_vector(15 downto 0);
        PMD:in std_logic_vector(23 downto 0);
        AMF:in std_logic_vector(4 downto 0);
        CI:in std_logic;
        EN:in  std_logic_vector(3 downto 0);
        AZ,AN,AC,AV,AS:out std_logic;
        alu_out:inout std_logic_vector(15 downto 0)
    );
end ALU;