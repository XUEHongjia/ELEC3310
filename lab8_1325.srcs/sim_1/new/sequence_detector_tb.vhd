----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/11/17 15:31:34
-- Design Name: 
-- Module Name: sequence_detector_tb - Behavioral
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

entity sequence_detector_tb is
--  Port ( );
end sequence_detector_tb;

architecture Behavioral of sequence_detector_tb is

component sequence_detector
port( clk_100M_in : in STD_LOGIC;
           clk_2s : inout std_logic;
           w : in STD_LOGIC;
           reset : in STD_LOGIC;
           z : out STD_LOGIC );
end component;

signal clk_100M_in_tb: std_logic:='0';
signal clk_2s_tb: std_logic:='0';
signal w_tb: std_logic:='0';
signal reset_tb: std_logic:='0';
signal z_tb: std_logic:='0';

begin

--port map
uut: sequence_detector port map(
clk_100M_in => clk_100M_in_tb,
clk_2s => clk_2s_tb,
w => w_tb,
reset => reset_tb,
z => z_tb
);

-- process for 100M clock
clock_process: process begin

clk_100M_in_TB <= '1'; wait for 5 ns; --100 MHz binary_read
clk_100M_in_TB <= '0'; wait for 5 ns; --100 MHz binary_read

end process;

-- clock period for clk_2s T = 100 ns and falling edge occur when t = kT ns
-- stimulation process with input sequence
stim_proc: process
begin        
   -- hold reset state for 100 ns.   
    reset_tb <= '1';
    wait for 240ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '1'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '1'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '1'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '1'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '1'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
    reset_tb <= '0'; w_tb <= '0'; wait for 100ns;
end process;

end Behavioral;
