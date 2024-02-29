library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY Multiplier is
    Generic(
    N : positive := 32;
    M : positive := 64
    );
    Port (
    A       : in std_logic_vector(N-1 downto 0); -- Multiplier
    B       : in std_logic_vector(N-1 downto 0); -- Multiplicant
    CLK, RST: in std_logic;
    R       : out std_logic_vector(M-1 downto 0);
    done    : out std_logic
    );
END Multiplier;

architecture Behavioral of Multiplier is
    component Adder is
        Generic(
        N : positive := 64
        );
        Port (
        A, B    : in std_logic_vector(N-1 downto 0);
        R       : out std_logic_vector(M-1 downto 0)
        );
    end component;

    component Shift_Reg is
        Generic(
        N : positive := 64
        );
        Port (
        A       : in std_logic_vector(N-1 downto 0);
        CLK, RST: in std_logic; 
        left, W : in std_logic;
        R       : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component Reg is
        Generic(
        N : positive := 64
        );
        Port (
        CLK     : IN     std_logic;
        D       : IN     std_logic_vector(N-1 downto 0);
        EN      : IN     std_logic;
        RST     : IN     std_logic;
        Q       : OUT    std_logic_vector(N-1 downto 0)
        );
    end component;

    component Counter is
        Generic(
        N : positive := 5
        );
        Port (
        CLK     : IN     std_logic;
        RST     : IN     std_logic;
        Q       : OUT    std_logic_vector(4 downto 0)
        );
    end component;  

    component Controll IS
        Port ( 
        CLK           : IN     std_logic;
        START         : IN     std_logic;
        M0            : IN     std_logic; --LSB of B
        RST           : IN     std_logic;
        Count         : IN     std_logic_vector(4 downto 0);
        A_W           : OUT    std_logic;
        B_W           : OUT    std_logic;
        EN            : OUT    std_logic;
        Reg_RST       : OUT    std_logic;
        Counter_RST   : OUT    std_logic;
        Done          : OUT    std_logic
        );
    end component;  

    signal A0, A1, P0, P1   : std_logic_vector(M-1 downto 0);
    signal B0               : std_logic_vector(N-1 downto 0); 
    signal count            : std_logic_vector(4 downto 0);
    signal EN, D            : std_logic;
    signal A_W, B_W         : std_logic;
    signal Reg_RST          : std_logic; 
    signal Counter_RST      : std_logic;

begin
    A0 <= (M-1 downto N => '0') & A;
    U1 : Shift_Reg generic map (N => M) port map(A => A0, W => A_W, CLK => CLK, RST => '0', left => '1', R => A1);
    U2 : Shift_Reg generic map (N => N) port map(A => B, W => B_W, CLK => CLK, RST => '0', left => '0', R => B0);    
    U3 : Adder     generic map (N => M) port map(A => A1, B => P0, R => P1);
    U4 : Counter   generic map (N => 5) port map(CLK => CLK, RST => Counter_RST, Q => count);
    U5 : Reg       generic map (N => M) port map(CLK => CLK, D => P1, EN => EN, RST => Reg_rst, Q => P0);
    U6 : Controll  port map(CLK => CLK, RST => RST, count => count, start => '1', M0 => B0(0),A_W => A_W, B_W => B_W, EN => EN, Reg_RST => Reg_RST, Counter_RST => Counter_RST, Done => D);
    
    R <= P0;
    Done <= D;

end Behavioral;

