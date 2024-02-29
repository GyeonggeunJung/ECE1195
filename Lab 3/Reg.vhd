library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY Reg is
    Generic(
    N : positive := 64
    );
    Port (
      CLK, EN, RST : IN     std_logic;
      D            : IN     std_logic_vector(N-1 downto 0);
      Q            : OUT    std_logic_vector(N-1 downto 0)
    );
END Reg;

ARCHITECTURE behavioral OF Reg IS
BEGIN
     process(CLK, RST)
     begin
        if(RST = '1') then
           Q <= (others => '0');
        elsif(CLK'event AND CLK = '1') then
           if(EN = '1') then
              Q <= D;
           end if;
        end if;
     end process;
END behavioral;