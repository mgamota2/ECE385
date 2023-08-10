## Generated SDC file "Lab4.out.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

## DATE    "Sat Feb 18 19:15:09 2023"

##
## DEVICE  "10M50DAF484C7G"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {Clk} -period 20.000 -waveform { 0.000 5.000 } [get_ports {Clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {Clk}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {Clk}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {Reset_Load_Clear}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {Reset_Load_Clear}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {Run}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {Run}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[0]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[0]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[1]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[1]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[2]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[2]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[3]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[3]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[4]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[4]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[5]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[5]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[6]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[6]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {SW[7]}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {SW[7]}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {altera_reserved_tck}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {altera_reserved_tck}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {altera_reserved_tdi}]
set_input_delay -add_delay -max -clock [get_clocks {Clk}]  3.000 [get_ports {altera_reserved_tms}]
set_input_delay -add_delay -min -clock [get_clocks {Clk}]  2.000 [get_ports {altera_reserved_tms}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Aval[7]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {Bval[7]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX0[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX0[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX0[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX0[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX0[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX0[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX0[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX1[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX1[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX1[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX1[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX1[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX1[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX1[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX2[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX2[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX2[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX2[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX2[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX2[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX2[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX3[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX3[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX3[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX3[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX3[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX3[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX3[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX4[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX4[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX4[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX4[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX4[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX4[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX4[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX5[0]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX5[1]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX5[2]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX5[3]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX5[4]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX5[5]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {HEX5[6]}]
set_output_delay -add_delay  -clock [get_clocks {Clk}]  2.000 [get_ports {altera_reserved_tdo}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

