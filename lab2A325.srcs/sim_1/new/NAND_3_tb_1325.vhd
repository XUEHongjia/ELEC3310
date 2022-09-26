----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/09/26 19:00:12
-- Design Name: 
-- Module Name: NAND_3_tb_1325 - Behavioral
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

entity NAND_3_tb_1325 is
   -- Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
    --       F : out STD_LOGIC);
end NAND_3_tb_1325;

architecture Behavioral of NAND_3_tb_1325 is

COMPONENT NAND_3_325
 PORT( 
 A : IN std_logic_vector(2 downto 0); 
 F : OUT std_logic 
 ); 
 END COMPONENT; 
  --Inputs 
 signal TB_A : std_logic_vector(2 downto 0):= (others => '0') ;
-- others => ¡¯0¡¯ above means set all elements of TB_A to 0, 
-- i.e. TB_A = 0000 above 
-- For example: TB_A : std logic_vector(3 downto 0) := (0 => ¡¯1¡¯, 
-- 3 => ¡¯1¡¯, others => ¡¯0¡¯); means TB_A = 1001 (bit 0 and 3 are 
-- set to ¡¯1¡¯ and all the other bits are set to ¡¯0¡¯) 
 --Outputs 
 signal TB_F : std_logic;
 
begin
 -- Instantiate the Unit Under Test (UUT) 
 uut: NAND_3_325 PORT MAP ( A => TB_A, F => TB_F); 
 -- => means ¡°mapping¡± above 
 -- Stimulus process 
 stim_proc: process 
 begin 
 -- hold reset state for 100 ns. 
 wait for 100 ns; 
 -- insert stimulus here 
TB_A <= "000"; wait for 10 ns; 
TB_A <= "001"; wait for 10 ns; 
TB_A <= "010"; wait for 10 ns; 
TB_A <= "011"; wait for 10 ns; 
TB_A <= "100"; wait for 10 ns; 
TB_A <= "101"; wait for 10 ns; 
TB_A <= "110"; wait for 10 ns; 
TB_A <= "111"; wait for 10 ns;  
wait; 
 end process; 

end Behavioral;
