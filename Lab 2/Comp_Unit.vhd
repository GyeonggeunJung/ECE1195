LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity CompUnit is
    Port (
    A, B, S, CO : in std_logic;
    op          : in std_logic_vector(1 downto 0);
    R           : out std_logic_vector(31 downto 0)
    );
end CompUnit;

architecture Behavioral of CompUnit is
    signal SLT, SLTU  : std_logic;
begin
    with A xor B select
        SLT <= S when '0',
        A when others;
    
    with A xor B select
        SLTU <= CO when '0',
        B when others;    
    
    with op select
        R <= x"0000000" & "000" & SLT when "10",
        x"0000000"& "000" & SLTU when others;    
end Behavioral;