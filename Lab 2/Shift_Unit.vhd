library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ShifterUnit is
    Port (
    A           : in std_logic_vector(31 downto 0);
    SHAMT       : in std_logic_vector(4 downto 0);
    R           : out std_logic_vector(31 downto 0);
    op          : in std_logic_vector(1 downto 0)
    );
end ShifterUnit;

architecture Behavioral of ShifterUnit is
begin
    
    with op select
    R <= std_logic_vector(shift_left(unsigned(A), to_integer(unsigned(SHAMT)))) when "00",
         std_logic_vector(shift_right(unsigned(A), to_integer(unsigned(SHAMT)))) when "10",
         std_logic_vector(shift_left(signed(A), to_integer(unsigned(SHAMT))))    when "01",
         std_logic_vector(shift_right(signed(A), to_integer(unsigned(SHAMT))))   when others; 
end Behavioral;