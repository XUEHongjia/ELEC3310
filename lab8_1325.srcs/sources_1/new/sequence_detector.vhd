----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2022/11/17 10:25:29
-- Design Name: 
-- Module Name: sequence_detector - Behavioral
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

entity sequence_detector is
    Port ( clk_100M_in : in STD_LOGIC;
           clk_2s : inout std_logic;
           w : in STD_LOGIC;
           reset : in STD_LOGIC;
           z : out STD_LOGIC);
end sequence_detector;

architecture Behavioral of sequence_detector is

-- stae type and signal define
type state_type is( A, B, C, D );
signal y : state_type;

-- clock devider define
component clk_divider
port (clk_100M_in: in std_logic; clk_2s: inout std_logic := '0');
end component;

begin
-- include the clock devider
CLKD: clk_divider port map ( clk_100M_in, clk_2s );

process( reset, clk_2s )
begin
    if  reset = '1' then
    y <= A;
    elsif falling_edge( clk_2s ) then
    case y is
    
        when A=>
        IF w = '0' THEN y <= A ;
        ELSE y <= B ;
        end if;
        
        when B=>
        IF w = '0' THEN y <= C ;
        ELSE y <= D ;
        end if;
        
        when C=>
        IF w = '0' THEN y <= A ;
        ELSE y <= D ;
        end if;
        
        when D=>
        IF w = '0' THEN y <= C ;
        ELSE y <= D ;
        end if;
        
    end case;
    end if;
end process;

PROCESS ( y, w )
BEGIN
    CASE y IS
        WHEN A =>
        z <= '0' ;
        WHEN B =>
        z <= not w ;
        WHEN C =>
        z <= not w ;
        WHEN D =>
        z <= '0' ;
END CASE ;
END PROCESS ;

end Behavioral;



-- archicture description of clock devider
library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL;

entity clk_divider is 
port (clk_100M_in: in std_logic; clk_2s: inout std_logic := '0'); --we initialize clk_2s to ?бу0?б└ 
end clk_divider; 
    
architecture mixed of clk_divider is 

--for real board    
--constant C_reload_value : unsigned(31 downto 0) := to_unsigned( 100000000 - 2, 32); 
--div 200M, for 0.5 Hz clk (2 secs clock) on real board 

-- for simulation
constant C_reload_value : unsigned(31 downto 0) := to_unsigned( 5 - 2, 32); 
--div 10, for 10 MHz clk in simulation 

signal counter : unsigned(31 downto 0) := C_reload_value; 

 begin 
 process(clk_100M_in) 
 begin 
 if rising_edge(clk_100M_in) then 
    if counter(31)='1' then 
        counter <= C_reload_value; 
        clk_2s <= not clk_2s; 
    else 
        counter <= counter - 1; 
    end if; 
 end if; 
 end process; 
     
end mixed; 
