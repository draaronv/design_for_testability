library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALUkernel is
    port(
        X,Y:in std_logic_vector(15 downto 0);
        CI:in std_logic;
        AMF:in std_logic_vector(4 downto 0);
        CLK: in std_logic;
        R:out std_logic_vector(15 downto 0);
        AZ,AN,AC,AV,AS:out std_logic
    );
end ALUkernel;