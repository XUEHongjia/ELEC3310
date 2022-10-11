----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/11 11:56:47
-- Design Name: 
-- Module Name: four_bit_adder_tb - Behavioral
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

entity four_bit_adder_tb is
--    Port ( C0_TB : in STD_LOGIC;
--           A0_TB : in STD_LOGIC;
--           A1_TB : in STD_LOGIC;
--           A2_TB : in STD_LOGIC;
--           A3_TB : in STD_LOGIC;
--           B0_TB : in STD_LOGIC;
--           B1_TB : in STD_LOGIC;
--           B2_TB : in STD_LOGIC;
--           B3_TB : in STD_LOGIC;
--           C4_TB : out STD_LOGIC;
--           S0_TB : out STD_LOGIC;
--           S1_TB : out STD_LOGIC;
--           S2_TB : out STD_LOGIC;
--           S3_Tb : out STD_LOGIC);
end four_bit_adder_tb;

architecture Behavioral of four_bit_adder_tb is

COMPONENT four_bit_adder
    Port ( C0 : in STD_LOGIC;
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C4 : out STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC);
 END COMPONENT; 
 
 signal C0_TB: std_logic;
 signal A0_TB: std_logic;
 signal A1_TB: std_logic;
 signal A2_TB: std_logic;
 signal A3_TB: std_logic;
 signal B0_TB: std_logic;
 signal B1_TB: std_logic;
 signal B2_TB: std_logic;
 signal B3_TB: std_logic;
 signal S0_TB: std_logic;
 signal S1_TB: std_logic;
 signal S2_TB: std_logic;
 signal S3_TB: std_logic;
 signal C4_TB: std_logic;

begin
 uut: four_bit_adder PORT MAP ( C0 => C0_TB, 
 A0 => A0_TB, 
 A1 => A1_TB,
 A2 => A2_TB,
 A3 => A3_TB,
 B0 => B0_TB,
 B1 => B1_TB,
 B2 => B2_TB,
 B3 => B3_TB,
 S0 => S0_TB,
 S1 => S1_TB,
 S2 => S2_TB,
 S3 => S3_TB,
 C4 => C4_TB ); 
 
stim_proc: process 
 begin 
 -- hold reset state for 100 ns. 
 -- wait for 100 ns; 
 -- insert stimulus here 
--Addition of numbers A and B (CO_TB <=¡¯1¡¯): 
C0_TB <= '0'; A3_TB <= '0'; A2_TB <= '0'; A1_TB <= '0'; A0_TB <= '0'; 
B3_TB <= '0'; B2_TB <= '0'; B1_TB <= '0'; B0_TB <= '0'; wait for 100 ns; 
--start at 100ns 
C0_TB <= '0'; A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '0'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '0'; B0_TB <= '0'; wait for 100 ns; 
--start at 200ns 
C0_TB <= '0'; A3_TB <= '1'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '0'; B0_TB <= '0'; wait for 100 ns; 
--start at 300ns 
C0_TB <= '0'; A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '0'; 
B3_TB <= '0'; B2_TB <= '1'; B1_TB <= '1'; B0_TB <= '1'; wait for 100 ns; 
--start at 400ns 
C0_TB <= '0'; A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '0'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '1'; B0_TB <= '0'; wait for 100 ns; 
--start at 500ns 
C0_TB <= '0'; A3_TB <= '1'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '1'; B0_TB <= '1'; wait for 100 ns;

--Same set of numbers for A and B as above, but doing subtraction (CO_TB <=¡¯1¡¯): 
--start at 600ns 
C0_TB <= '1'; A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '0'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '0'; B0_TB <= '0'; wait for 100 ns; 
--start at 700ns 
C0_TB <= '1'; A3_TB <= '1'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '0'; B0_TB <= '0'; wait for 100 ns; 
--start at 800ns 
C0_TB <= '1'; A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '0'; 
B3_TB <= '0'; B2_TB <= '1'; B1_TB <= '1'; B0_TB <= '1'; wait for 100 ns; 
--start at 900ns 
C0_TB <= '1'; A3_TB <= '0'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '0'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '1'; B0_TB <= '0'; wait for 100 ns; 
--start at 1000ns 
C0_TB <= '1'; A3_TB <= '1'; A2_TB <= '1'; A1_TB <= '1'; A0_TB <= '1'; 
B3_TB <= '1'; B2_TB <= '1'; B1_TB <= '1'; B0_TB <= '1'; wait for 100 ns; 
wait;
 end process;  


end Behavioral;
