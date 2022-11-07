----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2022 00:45:10
-- Design Name: 
-- Module Name: show_adder_sub_719 - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity show_adder_sub_1325 is
    Port ( Clock_100Mhz : in STD_LOGIC;
           Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0);
           LED_Seg : out STD_LOGIC_VECTOR (6 downto 0);
           A3,A2,A1,A0 : in STD_LOGIC;
           B3,B2,B1,B0 : in STD_LOGIC;
           Control : in STD_LOGIC;
           Error_LED : out STD_LOGIC;
           reset : in STD_LOGIC);
end show_adder_sub_1325;

architecture Behavioral of show_adder_sub_1325 is

COMPONENT four_bit_adder_sub_1325
        Port ( M : in STD_LOGIC;
        A3_in : in STD_LOGIC; A2_in : in STD_LOGIC; A1_in : in STD_LOGIC; A0_in : in STD_LOGIC; 
        B3_in : in STD_LOGIC; B2_in : in STD_LOGIC; B1_in : in STD_LOGIC; B0_in : in STD_LOGIC; 
        Error_bit : out STD_LOGIC; 
        S3_out : out STD_LOGIC; S2_out : out STD_LOGIC; S1_out : out STD_LOGIC;S0_out : out STD_LOGIC);
end COMPONENT;

COMPONENT seven_segment_display_VHDL
        Port( 
        clock_100Mhz: in std_logic;
        reset:in std_logic;
        anode_activate: out std_logic_vector(3 downto 0); --4 anode signals
        LED_out: out std_logic_vector(6 downto 0);
        displayed_number : in STD_LOGIC_VECTOR (15 downto 0)  );
    end COMPONENT;
    
signal displayed_number_temp : STD_LOGIC_VECTOR (15 downto 0) := ( others => '0' );

begin
AD: four_bit_adder_sub_1325 port map (
Control,
A3,A2,A1,A0,
B3,B2,B1,B0,
Error_LED,
displayed_number_temp(3),displayed_number_temp(2),displayed_number_temp(1),displayed_number_temp(0));

DP: seven_segment_display_VHDL port map(
clock_100Mhz, 
reset, 
Anode_Activate, 
LED_Seg, 
displayed_number_temp);

end Behavioral;

----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 Use ieee.numeric_std.all;

entity four_bit_adder_sub_1325 is 
    Port ( M : in STD_LOGIC;
        A3_in : in STD_LOGIC; A2_in : in STD_LOGIC; A1_in : in STD_LOGIC; A0_in : in STD_LOGIC; 
        B3_in : in STD_LOGIC; B2_in : in STD_LOGIC; B1_in : in STD_LOGIC; B0_in : in STD_LOGIC; 
        Error_bit : out STD_LOGIC; 
        S3_out : out STD_LOGIC; S2_out : out STD_LOGIC; S1_out : out STD_LOGIC;S0_out : out STD_LOGIC);
    end four_bit_adder_sub_1325;
    
architecture structural of four_bit_adder_sub_1325 is

signal C4, C3, C2, C1, C0: std_logic; signal int4,int3, int2, int1, int0: std_logic;

COMPONENT fulladder 
    port(X,Y,Z:IN std_logic;
        C,S: OUT std_logic); 
    end COMPONENT;
begin
     C0<=M;
    int0<= B0_in xor M; int1<= B1_in xor M; int2<= B2_in xor M; int3<= B3_in xor M;
    FA0: fulladder port map(A0_in, int0, C0,C1, S0_out); 
    FA1: fulladder port map(A1_in, int1, C1, C2,S1_out); 
    FA2: fulladder port map(A2_in, int2, C2, C3, S2_out); 
    FA3: fulladder port map(A3_in, int3, C3, C4,S3_out);
    int4<= C4;
    Error_bit <= int4 xor M;
end structural;

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
Use IEEE.numeric_std.all;
entity fulladder is 
    port(X,Y,Z: IN std_logic; 
        C,S: OUT std_logic);
end fulladder;

architecture dataflow of fulladder IS 
    begin
        C <= (X and Y) or (Y and Z) or (X and Z);
        S <= X xor Y xor Z; 
   end dataflow;
   
   
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-------7segments led
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity seven_segment_display_VHDL is 
    Port( 
        clock_100Mhz: in std_logic;
        reset:in std_logic;
        anode_activate: out std_logic_vector(3 downto 0); --4 anode signals
        LED_out: out std_logic_vector(6 downto 0)    ;
        displayed_number : in STD_LOGIC_VECTOR (15 downto 0)
    );
end seven_segment_display_VHDL;

architecture Behavioral of seven_segment_display_VHDL is

signal LED_BCD: STD_LOGIC_VECTOR (3 downto 0);
signal refresh_counter: STD_LOGIC_VECTOR (17 downto 0);
-- to create 2.62ms clock, divide by 2^18 ;(2.62x4=10.48ms refresh period) 
signal LED_activating_counter: std_logic_vector(1 downto 0);
signal displayed_number_dec : STD_LOGIC_VECTOR (15 downto 0);


begin
-- VHDL code for BCD to 7-segment decoder
-- Cathode patterns of the 7-segment LED display
process(LED_BCD) 
    begin
    case LED_BCD is
    when "0000" => LED_out <= "0000001"; -- "0" 
    when "0001" => LED_out <= "1001111"; -- "1"  
    when "0010" => LED_out <= "0010010"; -- "2" 
    when "0011" => LED_out <= "0000110"; -- "3"
    when "0100" => LED_out <= "1001100"; -- "4" 
    when "0101" => LED_out <= "0100100"; -- "5"
    when "0110" => LED_out <= "0100000"; -- "6" 
    when "0111" => LED_out <= "0001111"; -- "7"
    when "1000" => LED_out <= "0000000"; -- "8" 
    when "1001" => LED_out <= "0000100"; -- "9"   
    when others => LED_out <= "XXXXXXX"; 
    end case;
end process;

-- 7-segment display controller
--generate a 2.62ms clock, divide by 2^18 ;(2.62x4=10.48ms refresh period) 
process(clock_100Mhz, reset)
begin
    if (reset = '1') then
        refresh_counter <= (others => '0');
    elsif(rising_edge(clock_100Mhz)) then
    refresh_counter <= refresh_counter + 1;
    --FOR IMPLEMENTATION:
    --The statement "refresh_counter'range => '1' " means "refresh_counter = 111...1"
    --if(refresh_counter = (refresh_counter'range => '1')) then
    --LED_activating_counter <= LED_activating_counter + 1; 
    --end if;
    --FOR SIMULATION ONLY:
    LED_activating_counter <= refresh_counter(1 downto 0); --just for simulation
    end if; 
 end process;


-- For implementation:
-- 100MHz/2^18 = 381.47Hz = 2.62ms. The LED_activating_counter will count with a period
-- T=2.62ms and will activate each "7-segment LED" for this amount of time one at a time (there --are 4 seven-segment LED displays).
-- So, the refresh period (for the four "7-segment LED") will be: 2.62ms x 4 = 10.49ms, and the --refresh rate will be: 1/10.49ms = 95.4Hz

  -- 2-to-4 DEC to generate anode activating signals for 4 "7-segment LEDs"
process(LED_activating_counter) 
    begin
        case LED_activating_counter is when "00" =>
        anode_activate <= "0111";
        -- activate LED1 and Deactivate LED2, LED3, LED4
        LED_BCD <= displayed_number_dec(15 downto 12);
        -- the first hex digit of the 16-bit number
        when "01" =>
        anode_activate <= "1011";
        -- activate LED2 and Deactivate LED1, LED3, LED4
        LED_BCD <= displayed_number_dec(11 downto 8);
        -- the second hex digit of the 16-bit number
        
        when "10" =>
        anode_activate <= "1101";
        LED_BCD <= displayed_number_dec(7 downto 4);
        
        when "11" =>
        anode_activate <= "1110";
        LED_BCD <= displayed_number_dec(3 downto 0);

        when others => anode_activate <= "XXXX";
        end case; 
end process;

  -- Binary to BCD
process(displayed_number) 
    begin
        case displayed_number(3 downto 0) is 
        when "1010" =>
            displayed_number_dec(7 downto 4) <= "0001";
            displayed_number_dec(3 downto 0) <= "0000";
        when "1011" => 
            displayed_number_dec(7 downto 4) <= "0001";
            displayed_number_dec(3 downto 0) <= "0001";
        
        when "1100" =>
            displayed_number_dec(7 downto 4) <= "0001";
            displayed_number_dec(3 downto 0) <= "0010";
        when "1101" =>
            displayed_number_dec(7 downto 4) <= "0001";
            displayed_number_dec(3 downto 0) <= "0011";
        when "1110" =>
            displayed_number_dec(7 downto 4) <= "0001";
            displayed_number_dec(3 downto 0) <= "0100";
        when "1111" =>
            displayed_number_dec(7 downto 4) <= "0001";
            displayed_number_dec(3 downto 0) <= "0101";
        when others => displayed_number_dec <= displayed_number;
        
end case; end process;
end Behavioral;
    

