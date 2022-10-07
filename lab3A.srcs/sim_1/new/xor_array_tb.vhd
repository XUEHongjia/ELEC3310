----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/07 10:46:03
-- Design Name: 
-- Module Name: xor_array_tb - Behavioral
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

entity xor_array_tb is
--    Port ( TB_ctrl : in STD_LOGIC;
--           TB_X : in STD_LOGIC_VECTOR (4 downto 0);
--           TB_Y : out STD_LOGIC_VECTOR (4 downto 0));
end xor_array_tb;

architecture Behavioral of xor_array_tb is


COMPONENT xor_array
 PORT( 
 ctrl: IN std_logic;
 X : IN std_logic_vector(4 downto 0); 
 Y : OUT std_logic_vector( 4 downto 0 )
 ); 
 END COMPONENT; 
 
signal TB_X : std_logic_vector(4 downto 0):= (others => '0') ;
signal TB_ctrl: std_logic;
signal TB_Y : std_logic_vector(4 downto 0):= (others => '0') ;

begin
 uut: xor_array PORT MAP ( ctrl => TB_ctrl, X => TB_X, Y => TB_Y); 
 -- => means ¡°mapping¡± above 
 -- Stimulus process 
 stim_proc: process 
 begin 
 -- hold reset state for 100 ns. 
 TB_ctrl <= '0';
 wait for 100 ns; 
 -- insert stimulus here 
TB_ctrl <= '0'; TB_X <= "10101"; wait for 10 ns; 
TB_ctrl <= '1'; TB_X <= "10101"; wait for 10 ns; 
TB_ctrl <= '0'; TB_X <= "01010"; wait for 10 ns; 
TB_ctrl <= '1'; TB_X <= "01010"; wait for 10 ns; 

wait; 
 end process; 

end Behavioral;
