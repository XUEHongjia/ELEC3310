## Slide Switches as Output Enable 
## Switches 
 set_property PACKAGE_PIN V17 [get_ports { ctrl } ] 
 set_property IOSTANDARD LVCMOS33 [get_ports { ctrl }] 

set_property PACKAGE_PIN V16 [get_ports { X[0] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { X[0] }] 
#Bank = 14, Pin name = ,Sch name = BTNR 
set_property PACKAGE_PIN W16 [get_ports { X[1] }]
set_property IOSTANDARD LVCMOS33 [get_ports { X[1] }] 

set_property PACKAGE_PIN W17 [get_ports { X[2] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { X[2] }] 
#Bank = 14, Pin name = ,Sch name = BTNR 
set_property PACKAGE_PIN W15 [get_ports { X[3] }]
set_property IOSTANDARD LVCMOS33 [get_ports { X[3] }] 

set_property PACKAGE_PIN V15 [get_ports { X[4] }]
set_property IOSTANDARD LVCMOS33 [get_ports { X[4] }] 

 
## LEDs 
set_property PACKAGE_PIN U16 [get_ports { Y[0] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Y[0] }] 
set_property PACKAGE_PIN E19 [get_ports { Y[1] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Y[1] }]

set_property PACKAGE_PIN U19 [get_ports { Y[2] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Y[2] }] 
set_property PACKAGE_PIN V19 [get_ports { Y[3] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Y[3] }]

set_property PACKAGE_PIN W18 [get_ports { Y[4] }] 
set_property IOSTANDARD LVCMOS33 [get_ports { Y[4] }] 