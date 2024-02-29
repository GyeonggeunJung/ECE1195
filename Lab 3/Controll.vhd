LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY Controll IS
   PORT( 
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

END Controll ;

ARCHITECTURE struct OF Controll IS
	type state_type is (S0, S1, S2);
	   -- S0 start
	   -- S1 Shift and Save sum
	   -- S2 Shift
	signal state   : state_type;
	
begin
    process (clk, rst)
	begin
		if rst = '1' then
			state <= S0;
		elsif (rising_edge(clk)) then
			case state is
				when S0 =>
				    if(START = '1') then
					   state <= S1;
					else
					   state <= S0;
					end if;
				when S1 =>
					if Count = "11111" then
						state <= S2;
					else
						state <= S1;
					end if;
				when S2 =>
					state <= S2;
			end case;
		end if;
	end process;
	
	process (state, M0)
	begin
	
    case state is
        when s0 =>
            A_W <= '1';
            Reg_RST <= '1';
            EN <= '0';
            Done  <= '0';
            Counter_RST <= '1';
        when s1 =>
            A_W <= '0';
            Reg_RST <= '0';

            if M0 = '1' then
                EN <= '1';
            else
                EN <= '0';
            end if;
            
            Done  <= '0';
            Counter_RST <= '0';
        when s2 =>
            A_W <= '0';
            Reg_RST <= '0';
            EN <= '0';
            Done  <= '1';
            Counter_RST <= '0';
    end case;
            B_W <= A_W;
	end process;
    
END struct;