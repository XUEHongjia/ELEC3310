----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/24 15:37:00
-- Design Name: 
-- Module Name: four_bit_counter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_bit_counter is
    Port ( RST_in : in STD_LOGIC;
           EN_in : in STD_LOGIC;
           INP_in : in STD_LOGIC;
           CLK_100M_in : in STD_LOGIC;
           CLK_2S : inout STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (3 downto 0));
end four_bit_counter;

architecture structural of four_bit_counter is
signal q2_in, q3_in: std_logic;

component clk_divider
port (clk_in: in std_logic; clk_2s: inout std_logic := '0');
end component;

component toggle_ff
port (
RST, EN, INP, CLK: IN std_logic;
Q : INOUT std_logic
);
end component;

begin

q3_in <= Q(2) and q2_in;
q2_in <= Q(1) and Q(0);
CLKD: clk_divider port map ( CLK_100M_in, CLK_2S );
TFF0: toggle_ff port map ( RST_in, EN_in, INP_in, CLK_2S, Q(0) );
TFF1: toggle_ff port map ( RST_in, EN_in, Q(0), CLK_2S, Q(1) );
TFF2: toggle_ff port map ( RST_in, EN_in, q2_in, CLK_2S, Q(2) );
TFF3: toggle_ff port map ( RST_in, EN_in, q3_in, CLK_2S, Q(3) );

end structural;

--toggle flip-flop

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity toggle_ff is port
(
RST, EN, INP, CLK: IN std_logic;
Q : INOUT std_logic
);

end toggle_ff;

architecture mixed of toggle_ff is

signal T: std_logic;

begin

T <= EN and INP;

Q_output : process( CLK, RST )
           begin
            if RST = '1' then Q <= '0';
            elsif rising_edge(clk) then Q <= T xor Q;
            end if;
           end process;

end mixed;

library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 
entity clk_divider is 
port (clk_in: in std_logic; clk_2s: inout std_logic := '0'); --we initialize clk_2s to ¡°0¡± 
end clk_divider; 
architecture mixed of clk_divider is 
--constant C_reload_value : unsigned(31 downto 0) := to_unsigned( 100000000 - 2, 32); div 200M, for 0.5 Hz clk (2 secs clock) on real board 
constant C_reload_value : unsigned(31 downto 0) := to_unsigned( 5 - 2, 32); --div 10, for 10 MHz clk in simulation 
signal counter : unsigned(31 downto 0) := C_reload_value; 
 begin 
 process(clk_in) 
 begin 
 if rising_edge(clk_in) then 
 if counter(31)='1' then 
 counter <= C_reload_value; 
 clk_2s <= not clk_2s; 
 else 
 counter <= counter - 1; 
 end if; 
 end if; 
 end process; 
end mixed; 