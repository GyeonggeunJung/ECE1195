library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder is
    Generic(
    N : positive := 64
    );
    Port (
    A       : in std_logic_vector(N-1 downto 0); -- Multiplicant
    B       : in std_logic_vector(N-1 downto 0); -- Product
    R       : out std_logic_vector(N-1 downto 0)
    );
end Adder;

architecture behavioral of Adder is
    signal carry: STD_LOGIC_VECTOR(N downto 0);
begin
    carry(0) <= '0';

    Add_Sub: for i in 0 to N-1 generate
           R(i) <= A(i) xor (B(i) xor carry(i));
        carry(i+1) <= (A(i) and B(i)) or ((A(i) xor B(i)) and carry(i));
    end generate;
end behavioral;