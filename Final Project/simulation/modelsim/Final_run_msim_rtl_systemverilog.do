transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlib final_soc
vmap final_soc final_soc
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/final_soc.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_reset_controller.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_reset_synchronizer.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_avalon_st_adapter_004.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_avalon_st_adapter.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_avalon_sc_fifo.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_usb_rst.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_timer_0.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_sysid_qsys_0.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_spi_0.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_sdram_pll.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_sdram.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_nios2_gen2_0.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_nios2_gen2_0_cpu.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_nios2_gen2_0_cpu_debug_slave_sysclk.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_nios2_gen2_0_cpu_debug_slave_tck.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_nios2_gen2_0_cpu_debug_slave_wrapper.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_nios2_gen2_0_cpu_test_bench.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_leds_pio.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_keycode.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_key_external_connection.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_jtag_uart_0.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_hex_digits_pio.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_add_accumulate.v}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/Files/final_project.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/Files/VGA_controller.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/Files/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/UART {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/UART/RX_UART.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/UART {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/UART/GPS_UART.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/Files/img_rom.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/Files/img_palette.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/Files/img_example.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_irq_mapper.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_avalon_st_adapter_004_error_adapter_0.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_avalon_st_adapter_error_adapter_0.sv}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_avalon_st_handshake_clock_crosser.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_avalon_st_clock_crosser.v}
vlog -vlog01compat -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_std_synchronizer_nocut.v}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_width_adapter.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_burst_uncompressor.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_rsp_mux.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_arbitrator.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_rsp_demux.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_cmd_mux.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_cmd_demux.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_burst_adapter.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_burst_adapter_uncmpr.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_router_006.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_router_002.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/final_soc_mm_interconnect_0_router.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_slave_agent.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_master_agent.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_slave_translator.sv}
vlog -sv -work final_soc +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/final_soc/synthesis/submodules {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/final_soc/synthesis/submodules/altera_merlin_master_translator.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/UART {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/UART/gps_toplevel.sv}

vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Final\ Project/UART {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Final Project/UART/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -L final_soc -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
