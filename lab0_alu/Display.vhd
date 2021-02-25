library ieee;
use ieee.std_logic_signed.all;
use ieee.std_logic_1164.all;

entity Display is
    port(
        input:in std_logic_vector(3 downto 0);
        output1:out  std_logic_vector(6 downto 0)
    );
end Display;

architecture behav of Display is
    begin
        process(input)
        begin
            case input is
                when"0000" => output1<= "1000000"; -- 0
                when"0001" => output1<= "1111001"; -- 1
                when"0010" => output1<= "0100100"; -- 2
                when"0011" => output1<= "0110000"; -- 3
                when"0100" => output1<= "0011001"; -- 4
                when"0101" => output1<= "0010010"; -- 5
                when"0110" => output1<= "0000010"; -- 6
                when"0111" => output1<= "1111000"; -- 7
                when"1000" => output1<= "0000000"; -- 8
                when"1001" => output1<= "0010000"; -- 9
                when"1010" => output1<= "0001000"; -- 10 A
                when"1011" => output1<= "0000011"; -- 11 b
                when"1100" => output1<= "0100001"; -- 12 c
                when"1101" => output1<= "1000010"; -- 13 d
                when"1110" => output1<= "0000110"; -- 14 e
                when"1111" => output1<= "0001110"; -- 15 f
                when others => output1<= "1111111";
            end case;
    end process;
end behav;