transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/Reg_8.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/ripple_adder.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/mult_toplevel.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/control.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/X.sv}
vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/counter.sv}

vlog -sv -work work +incdir+C:/Users/mggam/Documents/Sophomore/Sem\ 2/ECE\ 385/Lab\ 4/Files {C:/Users/mggam/Documents/Sophomore/Sem 2/ECE 385/Lab 4/Files/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1500 ns
