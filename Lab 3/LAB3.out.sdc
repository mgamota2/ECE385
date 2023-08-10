create_clock -name Clk -period 20.000 [get_ports {Clk}]

set_input_delay -clock { Clk } -rise 0.5 [get_ports {Reset_Clear Run_Accumulate}]

set_input_delay -clock { Clk } -rise 0 [get_ports SW*]

set_output_delay -clock { Clk } -rise 0 [get_ports HEX*]

set_output_delay -clock { Clk } -rise 0 [get_ports LED*]

set_output_delay -clock { Clk } -rise 0 [get_ports {Cout}]
