all: main 

main: test.vpp
	vvp test.vvp -lxt2
test.vpp:
	iverilog -o test.vvp *.v