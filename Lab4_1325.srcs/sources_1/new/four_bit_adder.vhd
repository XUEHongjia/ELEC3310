----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/10/11 11:36:58
-- Design Name: 
-- Module Name: four_bit_adder - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity four_bit_adder is
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
end four_bit_adder;

architecture Structural of four_bit_adder is

COMPONENT full_adder
port(X,Y,C_in:IN std_logic; C_out,S: OUT std_logic); 
end COMPONENT;

signal C3,C2,C1: std_logic;

begin
FA0: full_adder port map (A0,B0,C0,C1,S0);
FA1: full_adder port map (A1,B1,C1,C2,S1);
FA2: full_adder port map (A2,B2,C2,C3,S2);
FA3: full_adder port map (A3,B3,C3,C4,S3); 

end Structural;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity full_adder is
    Port ( X : in STD_LOGIC;
           Y : in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC);
end full_adder;

architecture Structural of full_adder is

begin
S <= X xor Y xor C_in;
C_out <= ( (X and Y) or (Y and C_in) or (X and C_in) );

end Structural;