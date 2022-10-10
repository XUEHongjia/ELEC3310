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
           x0 : in STD_LOGIC;
           x1 : in STD_LOGIC;
           x2 : in STD_LOGIC;
           x3 : in STD_LOGIC;
           x4 : in STD_LOGIC;
           y0 : out STD_LOGIC;
           y1 : out STD_LOGIC;
           y2 : out STD_LOGIC;
           y3 : out STD_LOGIC;
           y4 : out STD_LOGIC);
end xor_array;

architecture Behavioral of xor_array is

begin
y0 <= x0 xor ctrl;
y1 <= x1 xor ctrl;
y2 <= x2 xor ctrl;
y3 <= x3 xor ctrl;
y4 <= x4 xor ctrl;

end Behavioral;
