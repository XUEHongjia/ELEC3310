set_property PACKAGE_PIN W5 [get_ports {CLK_100M_in}] 
set_property IOSTANDARD LVCMOS33 [get_ports {CLK_100_in}] 

## LEDs 
set_property PACKAGE_PIN U16 [get_ports { Q[0] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Q[0] }] 
set_property PACKAGE_PIN E19 [get_ports { Q[1] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Q[1] }]

set_property PACKAGE_PIN U19 [get_ports { Q[2] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Q[2] }] 
set_property PACKAGE_PIN V19 [get_ports { Q[3] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Q[3] }]
set_property PACKAGE_PIN W18 [get_ports { CLK_2S }] 
set_property IOSTANDARD LVCMOS33 [get_ports { CLK_2S }]

## Switches 
set_property PACKAGE_PIN V17 [get_ports { INP_in }] 
set_property IOSTANDARD LVCMOS33 [get_ports { INP_in }] 
set_property PACKAGE_PIN V16 [get_ports { EN_in }] 
set_property IOSTANDARD LVCMOS33 [get_ports { EN_in }] 

## button
set_property PACKAGE_PIN T18 [get_ports { RST_in }] 
set_property IOSTANDARD LVCMOS33 [get_ports { RST_in }]
