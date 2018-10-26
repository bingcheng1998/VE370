# Implement Verilog on MacBook Pro

## Install prerequisite software

1. Install icarus-verilog: `brew install icarus-verilog`.
2. Download and install Scansion [here](http://www.logicpoet.com/scansion/).

## Example

Makefile

```makefile
all: main.v add.v 
	iverilog -s HELLO_TEST -o main.vvp -tvvp main.v
	vvp main.vvp 

show:
	open -a Scansion main.vcd

clean:
	rm -f *.vvp *.vcd
```

Main.v

```verilog
`include "add.v"

module HELLO_TEST;
    reg iclk=0;
    reg a=0,b=0;
    wire c,d;
    always begin #1; iclk=!iclk; a=iclk; end
    always begin #3; b=!b; end
    add temp_add(.input_a(a),.input_b(b),.answer(c),.carry(d));
    initial
    begin
        $dumpfile("main.vcd");
        $dumpvars(0,temp_add);
        #100;
        $finish;
    end
endmodule
```

Add.v

```verilog
module add(input_a,input_b,answer,carry);
    input input_a;
    input input_b;
    output answer,carry;
    assign answer=input_a^input_b;
    assign carry=input_a&input_b;
endmodule
```

Terminal

```ruby
$ make
$ make show
$ make clean
```

## Wave figure

![vcd 1](https://ws4.sinaimg.cn/large/006tNbRwly1fwlwh2dkyzj31e00u4dhi.jpg)

![vcd 2](https://ws4.sinaimg.cn/large/006tNbRwly1fwlwhv4979j31e00u4wgt.jpg)

## Reference

[在 Mac 上编写 Verilog 代码](https://www.cnblogs.com/lijianlin1995/p/4520961.html)

[Icarus Verilog和GTKwave使用简析](https://blog.csdn.net/husipeng86/article/details/60469543)

[Iverilog Flags](http://iverilog.wikia.com/wiki/Iverilog_Flags)





