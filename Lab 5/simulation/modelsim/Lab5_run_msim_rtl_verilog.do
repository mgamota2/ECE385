transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/test_memory.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/synchronizers.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/SLC3_2.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/Mem2IO.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/Reg_16.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/MUX_16.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/MUX_3.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/addr_mux_unit.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/ALU.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/REGFILE.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/BRANCH_UNIT.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/memory_contents.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/ISDU.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/datapath.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/slc3.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/slc3_testtop.sv}

vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 5/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 5/Files/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 10 ms
