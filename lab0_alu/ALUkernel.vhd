library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
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
    signal result:std_logic_vector(15 downto 0);
    begin
        calculator:process(X,Y,AMF,CI)
            begin
                if(AMF="10000") then
                    result<=Y;
                elsif(AMF="10001") then
                    result<=Y+1;
                elsif(AMF="10010") then
                    result<=X+Y+CI;
                elsif(AMF="10011") then
                    result<=Y+X;
                elsif(AMF="10100") then
                    result<=not Y;
                elsif(AMF="10101") then
                    result<=-Y;
                elsif(AMF="10110") then
                    result<=X-Y+CI - 1;
                elsif(AMF="10111") then
                    result<=X-Y;
                elsif(AMF="11000") then
                    result<=Y-1;
                elsif(AMF="11001") then
                    result<=Y-X;
                elsif(AMF="11010") then
                    result<=Y-X+CI-1;  
                elsif(AMF="11011") then
                    result<=not X;  
                elsif(AMF="11100") then
                    result<=X and Y;  
                elsif(AMF="11101") then
                    result<=X or Y;  
                elsif(AMF="11110") then
                    result<=X xor Y;
                elsif(AMF="11111") then
                    result<= abs(X);
            end if;
        end process;

    checking:process(result,amf)
        begin
            if(result=x"00") then
                az<='1';
            else
                az<='0';
            if(signed(result)<0) then
                an<='1';
            else
                an<='0';
            if( (AMF="10001" or AMF="10010" or AMF="10011" or AMF="10110" or AMF="10110" or AMF="11000" or AMF="11001" or AMF="11010") and ( x(15)=y(15)  ) and ( result(15)/=x(15)  ) and (result(15)/=y(15))  ) then 
                av<='1';
            else
                av<='0';
            if(signed(x)<0) then
                as<='1';
            else
                as<='0';
        end if;
        end process;
end behav;