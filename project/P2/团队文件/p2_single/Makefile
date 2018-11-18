all: main 

main: test.vpp
	vvp test.vvp > Texual.txt

test.vpp: test_single.v
	iverilog -o test.vvp -tvvp test_single.v