----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/07 10:40:07
-- Design Name: 
-- Module Name: xor_array - Behavioral
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

entity xor_array is
    Port ( ctrl : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR (4 downto 0);
           Y : out STD_LOGIC_VECTOR (4 downto 0));
end xor_array;

architecture Behavioral of xor_array is

begin
Y(0) <= X(0) xor ctrl;
Y(1) <= X(1) xor ctrl;
Y(2) <= X(2) xor ctrl;
Y(3) <= X(3) xor ctrl;
Y(4) <= X(4) xor ctrl;

end Behavioral;
