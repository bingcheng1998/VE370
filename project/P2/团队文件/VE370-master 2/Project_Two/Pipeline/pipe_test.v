`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   21:34:58 11/21/2017
// Design Name:   pipeline
// Module Name:   /home/liu/VE370/p2/pipeline_tb.v
// Project Name:  p2
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: pipeline
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

`include "pipeline.v"

module pipeline_tb;

    integer i = 0;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Pipeline uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
        $dumpfile("pipeline.vcd");
        $dumpvars(1, uut);
        $display("Texual result of pipeline:");
        $display("==========================================================");
        #600;
        $stop;
	end

    always #10 begin
        $display("Time: %d, CLK = %d, PC = 0x%H", i, clk, uut.PC_out_IF);
        $display("[$s0] = 0x%H, [$s1] = 0x%H, [$s2] = 0x%H", uut.register.register_memory[16], uut.register.register_memory[17], uut.register.register_memory[18]);
        $display("[$s3] = 0x%H, [$s4] = 0x%H, [$s5] = 0x%H", uut.register.register_memory[19], uut.register.register_memory[20], uut.register.register_memory[21]);
        $display("[$s6] = 0x%H, [$s7] = 0x%H, [$t0] = 0x%H", uut.register.register_memory[22], uut.register.register_memory[23], uut.register.register_memory[8]);
        $display("[$t1] = 0x%H, [$t2] = 0x%H, [$t3] = 0x%H", uut.register.register_memory[9], uut.register.register_memory[10], uut.register.register_memory[11]);
        $display("[$t4] = 0x%H, [$t5] = 0x%H, [$t6] = 0x%H", uut.register.register_memory[12], uut.register.register_memory[13], uut.register.register_memory[14]);
        $display("[$t7] = 0x%H, [$t8] = 0x%H, [$t9] = 0x%H", uut.register.register_memory[15], uut.register.register_memory[24], uut.register.register_memory[25]);
        // $display(" PC realtaed value is PC_in_IF is 0x%H, PC_out_IF is 0x%H, PC_add4_IF is 0x%H, branch_result_IF is 0x%H", uut.PC_in_IF, uut.PC_out_IF, uut.PC_add4_IF, uut.branch_result_IF);


        // $display("")
        $display("=================================================");
        clk = ~clk;
        if (~clk) i = i + 1;
    end



endmodule