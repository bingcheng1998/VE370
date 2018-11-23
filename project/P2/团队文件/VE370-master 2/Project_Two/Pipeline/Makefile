all:main

main: test.vpp
	vvp test.vpp > out_pipe.txt

test.vpp: pipe_test.v
	iverilog -o test.vpp -tvvp pipe_test.v forwarding_unit.v hazard.v state_register.v adder.v control.v data_memory.v Mux_N_bit.v register.v sign_extension.v pc.v instruction_memory.v ALU_control.v ALU.v