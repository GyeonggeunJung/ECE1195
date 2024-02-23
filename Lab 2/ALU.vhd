
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Generic(
    N : positive := 32
    );
    Port (
    A           : in std_logic_vector(N-1 downto 0);
    B           : in std_logic_vector(N-1 downto 0);
    R           : out std_logic_vector(N-1 downto 0);
    ALUop       : in std_logic_vector(3 downto 0);
    SHAMT       : in std_logic_vector(4 downto 0);
    Zero        : out std_logic;
    Overflow    : out std_logic
    );
end ALU;

architecture Behavioral of ALU is
    component LogicalUnit port (
    A       : in std_logic_vector(31 downto 0);
    B       : in std_logic_vector(31 downto 0);
    op      : in std_logic_vector(1 downto 0);
    R       : out std_logic_vector(31 downto 0)
    );
    end component;
    
    component ShifterUnit port (
    A       : in std_logic_vector(31 downto 0);
    SHAMT   : in std_logic_vector(4 downto 0);
    op      : in std_logic_vector(1 downto 0);
    R       : out std_logic_vector(31 downto 0)
    );
    end component;
    
    component ArithUnit IS
    generic (
    n       : positive := 32);
    port( 
    A       : IN     std_logic_vector (n-1 DOWNTO 0);
    B       : IN     std_logic_vector (n-1 DOWNTO 0);
    C_op    : IN     std_logic_vector (1 DOWNTO 0);
    CO      : OUT    std_logic;
    OFL     : OUT    std_logic;
    S       : OUT    std_logic_vector (n-1 DOWNTO 0);
    Z       : OUT    std_logic
    );
    end component;
    
    component CompUnit is
    port (
    A, B, S, CO : in std_logic;
    op          : in std_logic_vector(1 downto 0);
    R           : out std_logic_vector(31 downto 0)
    );
    end component;   

    signal Logical, Arith, Comp, Shift : std_logic_vector(N-1 downto 0);
    signal CO : std_logic;
begin
    U1 : LogicalUnit port map(A => A, B => B, op => ALUop(1 downto 0), R => Logical);
    U2 : ShifterUnit port map(A => A, SHAMT => SHAMT, op => ALUop(1 downto 0), R => Shift);
    U3 : ArithUnit   port map(A => A, B => B, C_op => ALUop(1 downto 0), CO => CO, OFL => Overflow, S => Arith, Z => Zero);
    U4 : CompUnit    port map(A => A(N-1), B => B(N-1), S => Arith(N-1), CO => CO, op => ALUop(1 downto 0), R => Comp);
   
    with ALUop(3 downto 2) select
    R <= Logical when "00",
    Shift when "11",
    Comp when "10",
    Arith  when others;
    

end Behavioral;