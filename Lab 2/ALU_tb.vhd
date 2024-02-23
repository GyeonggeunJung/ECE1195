library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ALU_tb is
end ALU_tb;

architecture Simulation of ALU_tb is
    constant N : integer := 32;
    signal A, B, R : std_logic_vector(N-1 downto 0);
    signal ALUop   : std_logic_vector(3 downto 0);
    signal SHAMT   : std_logic_vector(4 downto 0);
    signal Zero, Overflow : std_logic;
    
component ALU is
    generic (
			N : positive := 32
		);
    Port (
    A           : in std_logic_vector(N-1 downto 0);
    B           : in std_logic_vector(N-1 downto 0);
    ALUop       : in std_logic_vector(3 downto 0);
    SHAMT       : in std_logic_vector(4 downto 0);
    R           : out std_logic_vector(N-1 downto 0);
    Zero        : out std_logic;
    Overflow    : out std_logic
    );
end component;

begin
    UT: ALU
    Generic map(N => N)
    Port    map(A => A, B=> B, R => R, ALUop => ALUop, SHAMT => SHAMT, Zero => Zero, Overflow => Overflow);
    process 
    begin
        -- Logical Operation
        --And
        A       <= x"FFFFFFFF";
        B       <= x"0000000F";
        ALUop   <= "0000";
        SHAMT   <= "00000";
        wait for 5 ns;
        --Or
        A       <= x"FFFFFFFF";
        B       <= x"00000001";
        ALUop   <= "0001";
        SHAMT   <= "00000";
        wait for 5 ns;
        --xor
        A       <= x"FFFFFFFF";
        B       <= x"00000001";
        ALUop   <= "0010";
        SHAMT   <= "00000";
        wait for 5 ns;
        --nor
        A       <= x"FFFFFFFF";
        B       <= x"00000001";
        ALUop   <= "0011";
        SHAMT   <= "00000";
        
        --Shift
        --SLL
        A       <= x"FEDCBA98";
        B       <= x"00000000";
        ALUop   <= "1100";
        SHAMT   <= "00011";
        wait for 5 ns;
        -- SLR
        A       <= x"FEDCBA98";
        B       <= x"00000000";
        ALUop   <= "1110";
        SHAMT   <= "00011";
        wait for 5 ns;
        -- SRL
        A       <= x"FEDCBA98";
        B       <= x"00000000";
        ALUop   <= "1101";
        SHAMT   <= "00011";
        wait for 5 ns;
        -- SRA
        A       <= x"FEDCBA98";
        B       <= x"00000000";
        ALUop   <= "1111";
        SHAMT   <= "00011";
        wait for 5 ns;

         
        --Arith
        -- Add signed
        A       <= x"FFFFFFFF";
        B       <= x"0000000F";
        ALUop   <= "0100";
        SHAMT   <= "00000";
        wait for 5 ns;
        -- Minus Sign
        A       <= x"FFFFFFFF";
        B       <= x"0000000F";
        ALUop   <= "0101";
        SHAMT   <= "00000";
        wait for 5 ns;
        -- Add unsigned
        A       <= x"FFFFFFFF";
        B       <= x"0000000F";
        ALUop   <= "0110";
        SHAMT   <= "00000";
        wait for 5 ns;
        -- Minus unsigned
        A       <= x"FFFFFFFF";
        B       <= x"0000000F";
        ALUop   <= "0111";
        SHAMT   <= "00000";
        wait for 5 ns;

        --Comp
        -- Add signed
        A       <= x"FFFFFFFF";
        B       <= x"0000000F";
        ALUop   <= "1010";
        SHAMT   <= "00000";
        wait for 5 ns;
        -- Minus Sign
        A       <= x"FFFFFFFF";
        B       <= x"0000000F";
        ALUop   <= "1011";
        SHAMT   <= "00000";
        wait for 5 ns;

    end process;
end Simulation;
