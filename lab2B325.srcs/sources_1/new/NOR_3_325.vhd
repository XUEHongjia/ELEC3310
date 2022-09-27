----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/09/26 19:41:56
-- Design Name: 
-- Module Name: NOR_3_325 - Behavioral
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

entity NOR_3_325 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           F : out STD_LOGIC);
end NOR_3_325;

architecture Behavioral of NOR_3_325 is
signal C0: std_logic;
signal C1: std_logic;
begin
C1 <= not (not A(2));
C0 <= A(0) or A(1);
F <= not( C1 or C0 );

end Behavioral;
