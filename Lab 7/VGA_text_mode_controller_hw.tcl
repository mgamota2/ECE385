# TCL File Generated by Component Editor 18.1
# Tue Apr 04 22:31:08 CDT 2023
# DO NOT MODIFY


# 
# VGA_text_mode_controller "VGA Text Mode Controller" v1.0
# Michael Gamota 2023.04.04.22:31:08
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module VGA_text_mode_controller
# 
set_module_property DESCRIPTION ""
set_module_property NAME VGA_text_mode_controller
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "ECE 385 Custom IPs"
set_module_property AUTHOR "Michael Gamota"
set_module_property DISPLAY_NAME "VGA Text Mode Controller"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL vga_text_avl_interface
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file vga_text_avl_interface.sv SYSTEM_VERILOG PATH "../Lab 7.2/Lab 7 alt_material/vga_text_avl_interface.sv" TOP_LEVEL_FILE

add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL vga_text_avl_interface
set_fileset_property SIM_VERILOG ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property SIM_VERILOG ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file vga_text_avl_interface.sv SYSTEM_VERILOG PATH "../Lab 7.2/Lab 7 alt_material/vga_text_avl_interface.sv"


# 
# parameters
# 


# 
# display items
# 


# 
# connection point CLK
# 
add_interface CLK clock end
set_interface_property CLK clockRate 50000000
set_interface_property CLK ENABLED true
set_interface_property CLK EXPORT_OF ""
set_interface_property CLK PORT_NAME_MAP ""
set_interface_property CLK CMSIS_SVD_VARIABLES ""
set_interface_property CLK SVD_ADDRESS_GROUP ""

add_interface_port CLK CLK clk Input 1


# 
# connection point RESET
# 
add_interface RESET reset end
set_interface_property RESET associatedClock CLK
set_interface_property RESET synchronousEdges DEASSERT
set_interface_property RESET ENABLED true
set_interface_property RESET EXPORT_OF ""
set_interface_property RESET PORT_NAME_MAP ""
set_interface_property RESET CMSIS_SVD_VARIABLES ""
set_interface_property RESET SVD_ADDRESS_GROUP ""

add_interface_port RESET RESET reset Input 1


# 
# connection point VGA_port
# 
add_interface VGA_port conduit end
set_interface_property VGA_port associatedClock CLK
set_interface_property VGA_port associatedReset RESET
set_interface_property VGA_port ENABLED true
set_interface_property VGA_port EXPORT_OF ""
set_interface_property VGA_port PORT_NAME_MAP ""
set_interface_property VGA_port CMSIS_SVD_VARIABLES ""
set_interface_property VGA_port SVD_ADDRESS_GROUP ""

add_interface_port VGA_port blue blue Output 4
add_interface_port VGA_port red red Output 4
add_interface_port VGA_port green green Output 4
add_interface_port VGA_port vs vs Output 1
add_interface_port VGA_port hs hs Output 1


# 
# connection point avl_mm_slave_1
# 
add_interface avl_mm_slave_1 avalon end
set_interface_property avl_mm_slave_1 addressUnits WORDS
set_interface_property avl_mm_slave_1 associatedClock CLK
set_interface_property avl_mm_slave_1 associatedReset RESET
set_interface_property avl_mm_slave_1 bitsPerSymbol 8
set_interface_property avl_mm_slave_1 burstOnBurstBoundariesOnly false
set_interface_property avl_mm_slave_1 burstcountUnits WORDS
set_interface_property avl_mm_slave_1 explicitAddressSpan 0
set_interface_property avl_mm_slave_1 holdTime 0
set_interface_property avl_mm_slave_1 linewrapBursts false
set_interface_property avl_mm_slave_1 maximumPendingReadTransactions 0
set_interface_property avl_mm_slave_1 maximumPendingWriteTransactions 0
set_interface_property avl_mm_slave_1 readLatency 0
set_interface_property avl_mm_slave_1 readWaitTime 1
set_interface_property avl_mm_slave_1 setupTime 0
set_interface_property avl_mm_slave_1 timingUnits Cycles
set_interface_property avl_mm_slave_1 writeWaitTime 0
set_interface_property avl_mm_slave_1 ENABLED true
set_interface_property avl_mm_slave_1 EXPORT_OF ""
set_interface_property avl_mm_slave_1 PORT_NAME_MAP ""
set_interface_property avl_mm_slave_1 CMSIS_SVD_VARIABLES ""
set_interface_property avl_mm_slave_1 SVD_ADDRESS_GROUP ""

add_interface_port avl_mm_slave_1 AVL_ADDR address Input 12
add_interface_port avl_mm_slave_1 AVL_CS chipselect Input 1
add_interface_port avl_mm_slave_1 AVL_READ read Input 1
add_interface_port avl_mm_slave_1 AVL_WRITE write Input 1
add_interface_port avl_mm_slave_1 AVL_READDATA readdata Output 32
add_interface_port avl_mm_slave_1 AVL_WRITEDATA writedata Input 32
add_interface_port avl_mm_slave_1 AVL_BYTE_EN byteenable Input 4
set_interface_assignment avl_mm_slave_1 embeddedsw.configuration.isFlash 0
set_interface_assignment avl_mm_slave_1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avl_mm_slave_1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avl_mm_slave_1 embeddedsw.configuration.isPrintableDevice 0

