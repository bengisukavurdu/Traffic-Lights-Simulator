library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity TrafficLightTb is
end entity;
 
architecture sim of TrafficLightTb is
 
    constant ClockFrequencyHz : integer := 100;
    constant ClockPeriod : time := 1000 ms / ClockFrequencyHz;
     
    signal Clk         : std_logic := '1';
    signal nRst        : std_logic := '0';
    signal NorthRed    : std_logic;
    signal NorthYellow : std_logic;
    signal NorthGreen  : std_logic;
    signal WestRed     : std_logic;
    signal WestYellow  : std_logic;
    signal WestGreen   : std_logic;
 
begin
 
   
    i_TrafficLights : entity work.TrafficLight(rtl)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        Clk         => Clk,
        nRst        => nRst,
        NorthRed    => NorthRed,
        NorthYellow => NorthYellow,
        NorthGreen  => NorthGreen,
        WestRed     => WestRed,
        WestYellow  => WestYellow,
        WestGreen   => WestGreen);
 
 
 
    Clk <= not Clk after ClockPeriod / 2;
 

    process is
    begin
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
     
 
        nRst <= '1';
     
        wait;
    end process;
     
end architecture;