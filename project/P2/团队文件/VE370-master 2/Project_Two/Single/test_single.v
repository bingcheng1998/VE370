`timescale 1ns / 1ps

`include "single_cycle.v"

module single_cycle_tb;

    integer i = 0;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	single_cycle uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
        $dumpfile("single_cycle.vcd");
        $dumpvars(1, uut);
        $display("Texual result of single cycle:");
        $display("==========================================================");
        #500;
        $stop;
	end

    always #10 begin
        $display("Time: %d, CLK = %d, PC = 0x%H", i, clk, uut.PC_out);
        $display("[$s0] = 0x%H, [$s1] = 0x%H, [$s2] = 0x%H",uut.get_reg.register_memory[16], 
        uut.get_reg.register_memory[17], 
        uut.get_reg.register_memory[18]);
        $display("[$s3] = 0x%H, [$s4] = 0x%H, [$s5] = 0x%H", uut.get_reg.register_memory[19], uut.get_reg.register_memory[20], uut.get_reg.register_memory[21]);
        $display("[$s6] = 0x%H, [$s7] = 0x%H, [$t0] = 0x%H", uut.get_reg.register_memory[22], uut.get_reg.register_memory[23], uut.get_reg.register_memory[8]);
        $display("[$t1] = 0x%H, [$t2] = 0x%H, [$t3] = 0x%H", uut.get_reg.register_memory[9], uut.get_reg.register_memory[10], uut.get_reg.register_memory[11]);
        $display("[$t4] = 0x%H, [$t5] = 0x%H, [$t6] = 0x%H", uut.get_reg.register_memory[12], uut.get_reg.register_memory[13], uut.get_reg.register_memory[14]);
        $display("[$t7] = 0x%H, [$t8] = 0x%H, [$t9] = 0x%H", uut.get_reg.register_memory[15], uut.get_reg.register_memory[24], uut.get_reg.register_memory[25]);
        // $display("Other imformations like writeData = 0x%H, writeAddress = 0x%H, write %d, ALU_out 0x%H, ALU_CON 0x%H,ALU_a 0x%H, ALU_b 0x%H, Branch_out 0x%H, Branch_result 0x%H, DMREAD 0x%H",uut.write_data,uut.write_address,uut.RegWrite,uut.ALU_out,uut.ALU_control_out,uut.ALU_a,uut.ALU_b,uut.branch_out,uut.branch_result,uut.D_MEM_read_data);
        $display("----------------------------------------------------------");
        clk = ~clk;
        if (~clk) i = i + 1;
    end

endmodule
