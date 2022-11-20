set_property PACKAGE_PIN W5 [get_ports { clk_100M_in }] 
set_property IOSTANDARD LVCMOS33 [get_ports { clk_100M_in }] 

## LEDs 
set_property PACKAGE_PIN U14 [get_ports { clk_2s }] 
set_property IOSTANDARD LVCMOS33 [get_ports { clk_2s }] 
set_property PACKAGE_PIN U15 [get_ports { z }] 
set_property IOSTANDARD LVCMOS33 [get_ports { z }]

## button
set_property PACKAGE_PIN T18 [get_ports { reset }] 
set_property IOSTANDARD LVCMOS33 [get_ports { reset }]
set_property PACKAGE_PIN U18 [get_ports { w }] 
set_property IOSTANDARD LVCMOS33 [get_ports { w }]
