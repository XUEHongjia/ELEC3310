----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/24 19:52:05
-- Design Name: 
-- Module Name: four_bit_up_counter_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_bit_up_counter_tb is
--  Port ( );
end four_bit_up_counter_tb;

architecture Behavioral of four_bit_up_counter_tb is

component four_bit_counter
 Port (    RST_in : in STD_LOGIC;
           EN_in : in STD_LOGIC;
           INP_in : in STD_LOGIC;
           CLK_100M_in : in STD_LOGIC;
           CLK_2S : inout STD_LOGIC;
           Q : inout STD_LOGIC_VECTOR (3 downto 0));
end component;

 signal rst_in_TB: STD_LOGIC := '0';
 signal clk_100M_in_TB: STD_LOGIC := '0';
 signal en_in_tb: std_logic;
 signal inp_in_tb: std_logic;
 signal clk_2s_TB: STD_LOGIC; 
 signal q_TB: STD_LOGIC_VECTOR (3 downto 0); 

begin
uut: four_bit_counter port map
(
RST_in => rst_in_TB,
EN_in => en_in_tb,
INP_in => inp_in_tb,
CLK_100M_in => clk_100M_in_TB,
CLK_2S => clk_2s_TB,
Q => q_TB
);

clock_process: process begin

clk_100M_in_TB <= '0'; wait for 5 ns; --100 MHz binary_read
clk_100M_in_TB <= '1'; wait for 5 ns; --100 MHz binary_read

end process;

stim_proc: process
begin        
   -- hold reset state for 100 ns.   
    en_in_tb <= '1';
    inp_in_tb <= '1';
    rst_in_TB <= '1';
    wait for 200ns;
    rst_in_TB <= '0';
   wait;
end process;

end Behavioral;
