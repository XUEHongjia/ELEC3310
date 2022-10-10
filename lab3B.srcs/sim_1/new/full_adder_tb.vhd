----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/07 09:55:37
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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

entity full_adder_tb is
    --Port ( X_tb : in STD_LOGIC;
      --     Y_tb : in STD_LOGIC;
        --   C_in_tb : in STD_LOGIC;
          -- S_tb : out STD_LOGIC;
           --C_out_tb : out STD_LOGIC);
end full_adder_tb;

architecture Behavioral of full_adder_tb is

COMPONENT full_adder
 PORT( 
 X : IN std_logic;
 Y : IN std_logic;
 C_in : IN std_logic;
 S : OUT std_logic; 
 C_out : OUT std_logic 
 ); 
 END COMPONENT; 
 
 signal TB_X: std_logic;
 signal TB_Y: std_logic;
 signal TB_C_in: std_logic;
 signal TB_S: std_logic;
 signal TB_C_out: std_logic;

begin
 -- Instantiate the Unit Under Test (UUT) 
 uut: full_adder PORT MAP ( X => TB_X, Y => TB_Y, C_in => TB_C_in, S => TB_S, C_out => TB_C_out); 
 -- => means ¡°mapping¡± above 
 -- Stimulus process 
 stim_proc: process 
 begin 
  wait for 100 ns; 
  TB_X <= '0'; TB_Y <= '0'; TB_C_in <= '0'; wait for 100 ns;
  TB_X <= '0'; TB_Y <= '0'; TB_C_in <= '1'; wait for 100 ns;
  TB_X <= '0'; TB_Y <= '1'; TB_C_in <= '0'; wait for 100 ns;
  TB_X <= '0'; TB_Y <= '1'; TB_C_in <= '1'; wait for 100 ns;
  TB_X <= '1'; TB_Y <= '0'; TB_C_in <= '0'; wait for 100 ns;
  TB_X <= '1'; TB_Y <= '0'; TB_C_in <= '1'; wait for 100 ns;
  TB_X <= '1'; TB_Y <= '1'; TB_C_in <= '0'; wait for 100 ns;
  TB_X <= '1'; TB_Y <= '1'; TB_C_in <= '1'; wait for 100 ns;
  wait; 
end process;

end Behavioral;
