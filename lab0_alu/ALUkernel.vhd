library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
-- x =input
-- y =input
-- CI =Carry in bit
-- AMF = Operational Code
-- CLK = Clock Signal
-- R = Result Output
-- AZ = zero or not
-- AN = negative or not
-- AC = carry out or not
-- AV = overflow or not
-- AS =operand x is negative
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

architecture behav of ALUkernel is
    begin
        ALUkernel:process(X,Y,AMF,CI)
            begin
                if(AMF="10000") then
                    R<=Y;
                elsif(AMF="10001") then
                    R<=Y+1;
                elsif(AMF="10010") then
                    R<=X+Y+CI;
                elsif(AMF="10011") then
                    R<=Y+X;
                elsif(AMF="10100") then
                    R<=not Y;
                elsif(AMF="10101") then
                    R<=-Y;
                elsif(AMF="10110") then
                    R<=X-Y+CI - 1;
                elsif(AMF="10111") then
                    R<=X-Y;
                elsif(AMF="11000") then
                    R<=Y-1;
                elsif(AMF="11001") then
                    R<=Y-X;
                elsif(AMF="11010") then
                    R<=Y-X+CI-1;  
                elsif(AMF="11011") then
                    R<=not X;  
                elsif(AMF="11100") then
                    R<=X and Y;  
                elsif(AMF="11101") then
                    R<=X or Y;  
                elsif(AMF="11110") then
                    R<=X xor Y;
                elsif(AMF="11111") then
                    R<= abs(X);
            end if;
end process;
end behav;