library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

ENTITY Counter is
    GENERIC (
      N       : positive := 5);
    PORT( 
      CLK : in     std_logic;
      RST : in     std_logic;
      Q   : out    std_logic_vector(N-1 downto 0)
   );

END ENTITY;

architecture Behavioral of Counter is
    signal C : std_logic_vector(N-1 downto 0);
begin
    process(CLK, RST)
     begin
        if(RST = '1') then
            C <= (others => '0');
        elsif(CLK'event AND CLK = '1') then
            C <= C + "00001";
        end if;
     end process;
     Q <= C;
end architecture;