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
 X0 : IN std_logic;
 X1 : IN std_logic;
 X2 : IN std_logic;
 X3 : IN std_logic;
 X4 : IN std_logic; 
 Y0 : OUT std_logic;
 Y1 : OUT std_logic;
 Y2 : OUT std_logic;
 Y3 : OUT std_logic;
 Y4 : OUT std_logic
 ); 
 END COMPONENT; 
 
signal TB_X0 : std_logic ;
signal TB_X1 : std_logic ;
signal TB_X2 : std_logic ;
signal TB_X3 : std_logic ;
signal TB_X4 : std_logic ;
signal TB_ctrl: std_logic;
signal TB_Y0 : std_logic ;
signal TB_Y1 : std_logic ;
signal TB_Y2 : std_logic ;
signal TB_Y3 : std_logic ;
signal TB_Y4 : std_logic ;

begin
 uut: xor_array PORT MAP ( ctrl => TB_ctrl, 
 X0 => TB_X0, 
 X1 => TB_X1, 
 X2 => TB_X2,
 X3 => TB_X3,
 X4 => TB_X4,
 Y0 => TB_Y0,
  Y1 => TB_Y1,
   Y2 => TB_Y2,
    Y3 => TB_Y3,
     Y4 => TB_Y4); 
 -- => means ¡°mapping¡± above 
 -- Stimulus process 
 stim_proc: process 
 begin 
 -- hold reset state for 100 ns. 
 wait for 100 ns; 
 -- insert stimulus here 
TB_ctrl <= '0'; TB_X0 <= '1'; TB_X1 <= '0'; TB_X2 <= '1'; TB_X3 <= '0'; TB_X4 <= '1'; wait for 100 ns; 
TB_ctrl <= '1'; TB_X0 <= '0'; TB_X1 <= '1'; TB_X2 <= '0'; TB_X3 <= '1'; TB_X4 <= '0'; wait for 100 ns; 
TB_ctrl <= '0'; TB_X0 <= '1'; TB_X1 <= '0'; TB_X2 <= '1'; TB_X3 <= '0'; TB_X4 <= '1'; wait for 100 ns; 
TB_ctrl <= '1'; TB_X0 <= '0'; TB_X1 <= '1'; TB_X2 <= '0'; TB_X3 <= '1'; TB_X4 <= '0'; wait for 100 ns; 

wait; 
 end process; 

end Behavioral;
