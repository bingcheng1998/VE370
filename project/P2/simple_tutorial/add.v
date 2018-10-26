/* Bingcheng, website: bingcheng1998.github.io 				*/
/* Implement Verilog file: `brew install icarus-verilog`	*/
/* This file was wrote on Oct 27, 2018 						*/


module add(input_a,input_b,answer,carry);
    input input_a;
    input input_b;
    output answer,carry;
    assign answer=input_a^input_b;
    assign carry=input_a&input_b;
endmodule