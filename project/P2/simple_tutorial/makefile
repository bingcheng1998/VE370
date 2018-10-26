all: main.v add.v 
	iverilog -s HELLO_TEST -o main.vvp -tvvp main.v
	vvp main.vvp 

show:
	open -a Scansion main.vcd

clean:
	rm -f *.vvp *.vcd