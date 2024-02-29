library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY Shift_Reg is
    Generic(
    N : positive := 32
    );
    Port (
    A       : in std_logic_vector(N-1 downto 0);
    CLK, RST: in std_logic;
    left, W : in std_logic;
    R       : out std_logic_vector(N-1 downto 0)
    );
END Shift_Reg;

architecture Behavioral of Shift_Reg is
    signal S : std_logic_vector(N-1 downto 0);
begin
    R <= S;
    process (RST, CLK)
    begin
        if RST = '1' then
            S <= (others => '0');
        elsif (CLK'EVENT AND CLK = '1') then
            if W = '1' then
                S <= A;
            elsif W = '0' then
                if left = '1' then
                S <= S(N-2 downto 0) & '0';
                elsif left = '0' then    
                S <= A(N-1) & S(N-1 downto 1);
                end if;
            end if;
        end if;
    end process;
end Behavioral;