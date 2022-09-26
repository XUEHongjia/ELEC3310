----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/09/26 18:36:45
-- Design Name: 
-- Module Name: NAND_3_325 - Behavioral
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

entity NAND_3_325 is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           F : out STD_LOGIC);
end NAND_3_325;

architecture Behavioral of NAND_3_325 is

begin
F <= not( ( A(0) and A(1) ) and ( A(2) and '1' ) );

end Behavioral;
