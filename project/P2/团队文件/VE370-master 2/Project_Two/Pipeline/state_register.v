`ifndef MODULE_STATE_REG
`define MODULE_STATE_REG
`timescale 1ns / 1ps

module IF_ID_Reg(
        // Data input 
        input   [31:0]    PC_plus4_in,instruction_in, 
        // Control signal input
        input             IF_ID_Write, IF_Flush, clk, reset,
        // output
        output  [31:0]    PC_plus4_out,instruction_out
);
        reg [31:0] PC_plus4_out, instruction_out;

		initial begin
			PC_plus4_out <= 32'b0;
			instruction_out <= 32'b0;
		end
        always @(posedge clk or posedge reset)
        begin if (reset == 1'b1|| IF_Flush == 1'b1) begin
				PC_plus4_out <= 32'b0;
				instruction_out <= 32'b0;			  	
			end	else if(IF_ID_Write == 1'b1) begin
				PC_plus4_out <= PC_plus4_in;
				instruction_out <= instruction_in;
			end
        end
endmodule

// Since branch and jump are taken within ID stage, no need to keep Branch jump as well as the address to this register.
module ID_EX_Reg(
        // *****INPUT********
        input           clk,reset,
        // hazard control signal
        input           flush,
        // Control signal
        input           RegDst,
                        MemtoReg,
                        // Branch,
                        MemRead,
                        MemWrite,
                        ALUSrc,
                        RegWrite,
        input   [1:0]   ALUop,
        // input   [31:0]  PC_plus4_in,
        // Read data
        input   [31:0]  reg_read_data_1,reg_read_data_2,extended_imm,
        // Register ID
        input   [4:0]   IF_ID_Register_Rs,IF_ID_Register_Rt, IF_ID_Register_Rd,
        //  ******OUTPUT******
        output  reg     out_RegDst,
                        out_MemRead,
                        out_MemtoReg,
                        out_MemWrite,
                        out_ALUSrc,
                        out_RegWrite,
        output reg [31:0]  reg_read_data_1_out,reg_read_data_2_out, extended_imm_out, 
		// PC_plus4_out, jump_address_out,
        output reg [4:0]   IF_ID_Register_Rs_out,IF_ID_Register_Rd_out,IF_ID_Register_Rt_out,
		output reg [1:0]   ALUop_out
        
);
	// For ID_Flush == 1, which means that lw occurs anc cannnot be solved with forwarding, set WB, MEM, EX control signal to 0.
	initial begin
		out_RegDst 		= 1'b0;
		// out_Jump 		= 1'b0;
		// out_Branch 		= 1'b0;
		out_MemRead 	= 1'b0;
		out_MemtoReg 	= 1'b0;
		out_MemWrite 	= 1'b0;
		out_ALUSrc 		= 1'b0;
		out_RegWrite 	= 1'b0;
		ALUop_out		= 2'b0;
		reg_read_data_1_out = 32'b0;
		reg_read_data_2_out = 32'b0;
		// extended_imm_out	= 32'b0;
		IF_ID_Register_Rd_out = 5'b0;
		IF_ID_Register_Rs_out = 5'b0;
		IF_ID_Register_Rt_out = 5'b0;
		// funct_out			  = 6'b0;
	end

	always @(posedge clk or posedge reset)
	begin
	  	if (reset == 1'b1) begin
			out_RegDst 		= 1'b0;
			// out_Jump 		= 1'b0;
			// out_Branch 		= 1'b0;
			out_MemRead 	= 1'b0;
			out_MemtoReg 	= 1'b0;
			out_MemWrite 	= 1'b0;
			out_ALUSrc 		= 1'b0;
			out_RegWrite 	= 1'b0;
			ALUop_out		= 2'b0;
			reg_read_data_1_out = 32'b0;
			reg_read_data_2_out = 32'b0;
			extended_imm_out	= 32'b0;
			IF_ID_Register_Rd_out = 5'b0;
			IF_ID_Register_Rs_out = 5'b0;
			IF_ID_Register_Rt_out = 5'b0;
		  end else if(flush) begin
			out_RegWrite = 1'b0;
			out_MemtoReg = 1'b0;
			// out_Branch	 = 1'b0;
			out_MemRead	 = 1'b0;
			out_MemWrite = 1'b0;
			// out_Jump	 = 1'b0;
			out_ALUSrc	 = 1'b0;
			out_RegDst   = 1'b0;
			ALUop_out	 = 2'b0;
		  end else begin
			out_RegWrite <= RegWrite;
			out_MemtoReg <= MemtoReg;
			// out_Branch = Branch;
			out_MemRead <= MemRead;
			out_MemWrite <= MemWrite;
			// out_Jump = Jump;
			out_RegDst <= RegDst;
			out_ALUSrc <= ALUSrc;
			ALUop_out <= ALUop;
			// jump_addr_out = jump_address;
			// PC_plus4_out = PC_plus4_in;
			reg_read_data_1_out <= reg_read_data_1;
			reg_read_data_2_out <= reg_read_data_2;
			extended_imm_out <= extended_imm;
			IF_ID_Register_Rs_out <= IF_ID_Register_Rs;
			IF_ID_Register_Rt_out <= IF_ID_Register_Rt;
			IF_ID_Register_Rd_out <= IF_ID_Register_Rd;
			// funct_out = funct;
		  end
	end
endmodule


module EX_MEM_Reg(
	input 		clk,reset,
	// Hazard signal,
	// Flush in ID/EX will keep the control signal here zero and do not need flush signal any more. For this stage, just store information every posedge.
	// Control Signal
				RegWrite,
				MemtoReg,
				// Branch,
				MemRead,
				MemWrite,
				// Jump,
	output	reg	RegWrite_out,
				MemtoReg_out,
				// Branch_out,
				MemRead_out,
				MemWrite_out,
				// Jump_out,
	// Data
	input 		[31:0] 	ALU_result,reg_read_data_2,
	output	reg [31:0]	ALU_result_out, reg_read_data_2_out,
	input		[4:0]	ID_EX_Regsiter_Rd,
	output 	reg [4:0]	EX_MEM_Regsiter_Rd_out
	// No need for ALU zero
	// input 				ALU_zero,
	// output	reg			ALU_zero_out
);
	initial begin
		ALU_result_out = 32'b0;
		reg_read_data_2_out = 32'b0;
		EX_MEM_Regsiter_Rd_out = 5'b0;
		// ALU_zero_out  = 1'b0;
		RegWrite_out = 1'b0;
		MemtoReg_out = 1'b0;
		MemRead_out = 1'b0;
		MemWrite_out = 1'b0;
	end

	always @(posedge clk or posedge reset)
	begin
	  	if(reset == 1'b1)
			begin
				ALU_result_out = 32'b0;
				reg_read_data_2_out = 32'b0;
				EX_MEM_Regsiter_Rd_out = 5'b0;
				// branch_addr_out	= 32'b0;
				// jump_addr_out = 32'b0;
				// ALU_zero_out  = 1'b0;
				RegWrite_out = 1'b0;
				MemtoReg_out = 1'b0;
				// Branch_out = 1'b0;
				MemRead_out = 1'b0;
				MemWrite_out = 1'b0;
				// Jump_out = 1'b0;
			end 
		else begin
				MemRead_out = MemRead;
				RegWrite_out = RegWrite;
				MemWrite_out = MemWrite;
				MemtoReg_out = MemtoReg;
				ALU_result_out = ALU_result;
				reg_read_data_2_out = reg_read_data_2;
				EX_MEM_Regsiter_Rd_out = ID_EX_Regsiter_Rd;
		end
	// 		else if(EX_flush == 1'b1)
	// // Set control signal of WB and MEM to 0
	// 		begin
	// 			RegWrite_out = 1'b0;
	// 			MemtoReg_out = 1'b0;
	// 			Branch_out = 1'b0;
	// 			MemRead_out = 1'b0;
	// 			MemWrite_out = 1'b0;
	// 			Jump_out = 1'b0;
	// 		end else begin
	// 			RegWrite_out = RegWrite;
	// 			MemtoReg_out = MemtoReg;
	// 			Branch_out   = Branch;
	// 			MemRead_out  = MemRead; 
	// 			MemWrite_out = MemWrite;
	// 			Jump_out	 = jump;
	// 			jump_addr_out = jump_addr_in;
	// 			branch_addr_out = branch_addr_in;
	// 			ALU_result_out 	= ALU_result;
	// 			reg_read_data_2_out = reg_read_data_2;
	// 			EX_MEM_Regsiter_Rd_out = ID_EX_Regsiter_Rd;
	// 		end
		end
endmodule

module MEM_WB_Reg(
	// ******INPUT*******
	input 			RegWrite,MemtoReg,
	input 	[31:0]	D_MEM_read_data_in,ALU_result,
	input  	[4:0]	EX_MEM_Reg_Rd,
	input			clk,reset,
	// ******OUTPUT*******
	output reg		RegWrite_out,MemtoReg_out,
	output reg [31:0] D_MEM_read_data_out,D_MEM_read_addr_out,
	output reg [4:0]  MEM_WB_Reg_Rd
);
	initial begin
		RegWrite_out = 1'b0;
		MemtoReg_out = 1'b0;
		MEM_WB_Reg_Rd = 5'b0;
		D_MEM_read_addr_out = 32'b0;
		D_MEM_read_data_out = 32'b0;
	end
	always @(posedge clk)
	begin
			RegWrite_out <= RegWrite;
			MemtoReg_out <= MemtoReg;
			MEM_WB_Reg_Rd <= EX_MEM_Reg_Rd;
			D_MEM_read_addr_out <= ALU_result;
			D_MEM_read_data_out <= D_MEM_read_data_in;				
	end
endmodule

`endif