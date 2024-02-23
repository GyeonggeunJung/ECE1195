library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicalUnit is
    Port (
    A       : in std_logic_vector(31 downto 0);
    B       : in std_logic_vector(31 downto 0);
    R       : out std_logic_vector(31 downto 0);
    op      : in std_logic_vector(1 downto 0)
    );
end LogicalUnit;
architecture Behavioral of LogicalUnit is
begin
    with op select
    R <= A and B when "00",
    A or B when "01",
    A xor B when "10",
    A nor B when others;
end Behavioral;