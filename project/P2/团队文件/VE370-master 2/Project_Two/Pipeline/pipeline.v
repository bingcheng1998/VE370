`ifndef MODULE_PIPELINE
`define MODULE_PIPELINE
`timescale 1ns / 1ps
`include "forwarding_unit.v"
`include "hazard.v"
`include "state_register.v"
`include "adder.v"
`include "control.v"
`include "data_memory.v"
`include "Mux_N_bit.v"
`include "register.v"
`include "sign_extension.v"
`include "pc.v"
`include "instruction_memory.v"
`include "ALU_control.v"
`include "ALU.v"
// `include ""


module Pipeline(
    input clk
);

    wire            reset;
    assign          reset = 1'b0;
    // Wire in IF stage
    wire    [31:0]  PC_in_IF,
                    PC_out_IF,
                    PC_add4_IF,
                    instrustion_IF,
                    branch_result_IF;

    wire            stall,
                    IF_ID_Write,    
                    IF_ID_flush;
    // wire in ID stage input of IDEX state regsiter, output of state regsiter start with EX
    wire    [31:0]  ID_EX_PC_add4,
                    ID_EX_PC_add4_res,
                    ID_EX_instrustion,
                    ID_EX_reg_read_data_1,
                    ID_EX_reg_read_data_2,
                    ID_EX_reg_read_new_data_1,
                    ID_EX_reg_read_new_data_2,
                    ID_EX_sign_extend,
                    ID_EX_jump_addr;

    wire    [4:0]   ID_EX_Reg_Rs,
                    ID_EX_Reg_Rt,
                    ID_EX_Reg_Rd;

    wire    [1:0]   ID_EX_alu_op;
    // Control signals
    wire            ID_EX_regDst,
                    ID_EX_branchEq,
                    ID_EX_branchNeq,
                    ID_EX_memRead,
                    ID_EX_memtoReg,
                    ID_EX_memWrite,
                    ID_EX_aluSrc,
                    ID_EX_regWrite,
                    ID_EX_branch,
                    ID_EX_jump,
    //  comparasions
                    ID_EX_equal_reg_read_data;
    
    // Wire in EX/MEM
    wire    [31:0]  EX_MEM_reg_read_data_1,
                    EX_MEM_reg_read_data_2,

                    EX_MEM_sign_extend,
                    // output of mux
                    EX_MEM_alu_in_one,
                    EX_MEM_alu_in_two,
                    EX_MEM_alu_temp_two,
                    EX_MEM_alu_result;

    wire    [4:0]   EX_MEM_reg_Rs,
                    EX_MEM_reg_Rt,
                    EX_MEM_reg_Rd,
                    EX_reg;   

    wire    [3:0]   EX_MEM_alu_control;    


    wire    [1:0]   EX_MEM_alu_op;
    wire            EX_MEM_regDst,
                    EX_MEM_memRead,
                    EX_MEM_memtoReg,
                    EX_MEM_memWrite,
                    EX_MEM_regWrite,
                    EX_MEM_aluSrc,
                    EX_MEM_aluZero;
                
    //  wire in MEM/WB
    wire    [31:0]  MEM_WB_alu_result,
                    MEM_WB_reg_read_data_2,
                    MEM_WB_D_MEM_read_data;
    
    wire    [4:0]   MEM_register;

    wire            MEM_WB_memRead,
                    MEM_WB_memtoReg,
                    MEM_WB_memWrite,
                    MEM_WB_regWrite;
    
    // wire in WB

    wire    [31:0]  WB_alu_result,
                    WB_D_MEM_read_data,
                    WB_D_MEM_read_addr,
                    WB_write_data;
    
    wire    [4:0]   WB_register;
    wire            WB_memtoReg,
                    WB_regWrite;
    // Data hazard
    wire    [1:0]   forward_A,
                    forward_B;
    
    wire            forward_C,
                    forward_D;

                

    assign PC_add4_IF = PC_out_IF + 4;
    // assign PC_in_IF = PC_add4_IF;
    // IF stage
    assign pc_wirte = ~stall;
    PC program_counter(
        .clk(clk),
        .PCWrite(pc_wirte),
        .in(PC_in_IF),
        .out(PC_out_IF)
    );

    instruction_memory ins_mem(
        .address(PC_out_IF),
        .instruction(instrustion_IF)
    );
    
    // IF/ID
    wire IF_Flush;
    assign IF_ID_Write = ~stall;
    IF_ID_Reg State_IF_ID(
        .clk(clk),
        .reset(reset),
        .PC_plus4_in(PC_add4_IF),
        .instruction_in(instrustion_IF),
        .IF_ID_Write(IF_ID_Write),
        .IF_Flush(IF_Flush),
        .PC_plus4_out(ID_EX_PC_add4),
        .instruction_out(ID_EX_instrustion)
    );
    //  ID stage 
    assign ID_EX_Reg_Rs = ID_EX_instrustion[25:21];
    assign ID_EX_Reg_Rt = ID_EX_instrustion[20:16];
    assign ID_EX_Reg_Rd = ID_EX_instrustion[15:11];

    wire ins_Beq,ins_Bne;

    Control control(
        .op_code(ID_EX_instrustion[31:26]),
        .ALUOp(ID_EX_alu_op),
        .RegDst(ID_EX_regDst),
        .Jump(ID_EX_jump),
        .Ins_Beq(ins_Beq),
        .Ins_Bne(ins_Bne),
        .MemRead(ID_EX_memRead),
        .MemtoReg(ID_EX_memtoReg),
        .MemWrite(ID_EX_memWrite),
        .ALUSrc(ID_EX_aluSrc),
        .RegWrite(ID_EX_regWrite)
    );
    //  The logic of branch is if instrutions is (ins_BEQ and reg_read_data1 == reg_read_data2) or (ins_BNE and reg_read_data1 != reg_read_data_2)

    Registers register(
        .clk(clk),
        .regWrite(WB_regWrite),
        // .write_data(WB_D_MEM_read_data),
        .read_register_1(ID_EX_Reg_Rs),
        .read_register_2(ID_EX_Reg_Rt),
        .write_register(WB_register),
        .write_data(WB_write_data),
        .read_data_1(ID_EX_reg_read_data_1),
        .read_data_2(ID_EX_reg_read_data_2)
    );

    sign_extension sign(
        .shortInput(ID_EX_instrustion[15:0]),
        .longOutput(ID_EX_sign_extend)
    );

    Mux_N_bit #(32) mux_one(
        .in1(MEM_WB_alu_result),
        .in2(ID_EX_reg_read_data_1),
        .select(forward_C),
        .out(ID_EX_reg_read_new_data_1)
    );

    Mux_N_bit #(32) mux_two(
        .in1(MEM_WB_alu_result),
        .in2(ID_EX_reg_read_data_2),
        .select(forward_D),
        .out(ID_EX_reg_read_new_data_2)
    );

    assign ID_EX_PC_add4_res = ID_EX_PC_add4 + (ID_EX_sign_extend<<2);
    // PC + 4[31:27]
    assign ID_EX_jump_addr = {ID_EX_PC_add4[31:28],ID_EX_instrustion[25:0],2'b0};
    assign ID_EX_equal_reg_read_data = (ID_EX_reg_read_new_data_1 == ID_EX_reg_read_new_data_2);
    assign ID_EX_branch = (ins_Beq && ID_EX_equal_reg_read_data) || (ins_Bne && ! ID_EX_equal_reg_read_data);

    assign branch_result_IF = (ID_EX_branch == 1'b0)?PC_add4_IF:ID_EX_PC_add4_res;
    assign PC_in_IF = (ID_EX_jump == 1'b0)?branch_result_IF:ID_EX_jump_addr;
    // Branch == 1 or Jump == 1 means that branch or jump is taken and we should flush the IF.
    assign IF_Flush = (ID_EX_jump||ID_EX_branch); 

    //  ID/EX
    // Flush signal connects to hazrd-detection unit.
    wire ID_EX_flush;
    ID_EX_Reg idex(
    //   Input
        .clk(clk),
        .reset(reset),
        .flush(ID_EX_flush),
        .RegDst(ID_EX_regDst),
        .MemtoReg(ID_EX_memtoReg),
        // .Branch(ID_EX_branch),
        .MemRead(ID_EX_memRead),
        .MemWrite(ID_EX_memWrite),
        .ALUSrc(ID_EX_aluSrc),
        .RegWrite(ID_EX_regWrite),
        .ALUop(ID_EX_alu_op),
        .reg_read_data_1(ID_EX_reg_read_data_1),
        .reg_read_data_2(ID_EX_reg_read_data_2),
        .extended_imm(ID_EX_sign_extend),
        .IF_ID_Register_Rs(ID_EX_Reg_Rs),
        .IF_ID_Register_Rt(ID_EX_Reg_Rt),
        .IF_ID_Register_Rd(ID_EX_Reg_Rd),
    
    //  output 
        .out_RegDst(EX_MEM_regDst),
        .out_MemRead(EX_MEM_memRead),
        .out_MemtoReg(EX_MEM_memtoReg),
        .out_MemWrite(EX_MEM_memWrite),
        .out_ALUSrc(EX_MEM_aluSrc),
        .out_RegWrite(EX_MEM_regWrite),
        .reg_read_data_1_out(EX_MEM_reg_read_data_1),
        .reg_read_data_2_out(EX_MEM_reg_read_data_2),
        .extended_imm_out(EX_MEM_sign_extend),
        .IF_ID_Register_Rs_out(EX_MEM_reg_Rs),
        .IF_ID_Register_Rd_out(EX_MEM_reg_Rd),
        .IF_ID_Register_Rt_out(EX_MEM_reg_Rt),
        .ALUop_out(EX_MEM_alu_op)
    );

    hazard_detection hazard(
        .ID_Reg_Rt(EX_MEM_reg_Rt),
        .IF_Reg_Rs(ID_EX_Reg_Rs),
        .IF_Reg_Rt(ID_EX_Reg_Rt),
        .EX_MemRead(EX_MEM_memRead),
        .EX_regWirte(EX_MEM_regWrite),
        .MEM_MemRead(MEM_WB_memRead),
        .Ins_Beq(ins_Beq),
        .Ins_Bne(ins_Bne),
        .stall(stall),
        .flush(ID_EX_flush)
    );

    // EX 
    ALU_control alu_control(
        .funct(EX_MEM_sign_extend[5:0]),
        .ALUOp(EX_MEM_alu_op),
        .ALUCtrl(EX_MEM_alu_control)
    );

    Mux_32bit_3to1 forward_A_Mux(
        .in00(EX_MEM_reg_read_data_1),
        .in01(WB_write_data),
        .in10(MEM_WB_alu_result),
        .control(forward_A),
        .mux_out(EX_MEM_alu_in_one)
    );

    Mux_32bit_3to1 forward_B_Mux(
        .in00(EX_MEM_reg_read_data_2),
        .in01(WB_write_data),
        .in10(MEM_WB_alu_result),
        .control(forward_B),
        .mux_out(EX_MEM_alu_temp_two)
    );

    assign EX_MEM_alu_in_two = (EX_MEM_aluSrc == 1'b0)?EX_MEM_alu_temp_two:EX_MEM_sign_extend;
    // Register stored in EX/MEM
    assign EX_reg = (EX_MEM_regDst == 0)?EX_MEM_reg_Rt:EX_MEM_reg_Rd;

    ALU alu(
        .a(EX_MEM_alu_in_one),
        .b(EX_MEM_alu_in_two),
        .ALUCtrl(EX_MEM_alu_control),
        .ALU_result(EX_MEM_alu_result),
        .zero(EX_MEM_aluZero)
    );

    // EX/MEM
    EX_MEM_Reg exmem(
        .clk(clk),
        .reset(reset),
        // .RegWrite(EX_MEM_regWrite),
        .MemtoReg(EX_MEM_memtoReg),
        .MemRead(EX_MEM_memRead),
        .MemWrite(EX_MEM_memWrite),
        .ALU_result(EX_MEM_alu_result),
        .reg_read_data_2(EX_MEM_alu_temp_two),
        .ID_EX_Regsiter_Rd(EX_reg),
        // output
        .ALU_result_out(MEM_WB_alu_result),
        .reg_read_data_2_out(MEM_WB_reg_read_data_2),
        .EX_MEM_Regsiter_Rd_out(MEM_register),
        // .RegWrite_out(MEM_WB_regWrite),
        .MemtoReg_out(MEM_WB_memtoReg),
        .MemRead_out(MEM_WB_memRead),
        .MemWrite_out(MEM_WB_memWrite)
    );
    reg [31:0] buffer;
    always @(posedge clk)begin
      buffer <= EX_MEM_regWrite;
    end
    assign MEM_WB_regWrite = buffer;
    data_memory dm(
        .clk(clk),
        .MemRead(MEM_WB_memRead),
        .MemWrite(MEM_WB_memWrite),
        .address(MEM_WB_alu_result),
        .write_data(MEM_WB_reg_read_data_2),
        .read_data(MEM_WB_D_MEM_read_data)
    );

    // MEM/WB
    MEM_WB_Reg mem_wb(
        .RegWrite(MEM_WB_regWrite),
        .MemtoReg(MEM_WB_memtoReg),
        .D_MEM_read_data_in(MEM_WB_D_MEM_read_data),
        .ALU_result(MEM_WB_alu_result),
        .EX_MEM_Reg_Rd(MEM_register),
        .clk(clk),
        .reset(reset),
        .D_MEM_read_data_out(WB_D_MEM_read_data),
        .D_MEM_read_addr_out(WB_D_MEM_read_addr),
        .RegWrite_out(WB_regWrite),
        .MemtoReg_out(WB_memtoReg),
        .MEM_WB_Reg_Rd(WB_register)
    );


    assign WB_write_data = (WB_memtoReg == 0) ? WB_D_MEM_read_addr:WB_D_MEM_read_data;

    Forwarding forward(
        .ID_EX_Reg_Rt(EX_MEM_reg_Rt),
        .ID_EX_Reg_Rs(EX_MEM_reg_Rs),
        .IF_ID_Reg_Rs(ID_EX_Reg_Rs),
        .IF_ID_Reg_Rt(ID_EX_Reg_Rt),
        .EX_MEM_Reg_Rd(MEM_register),
        .MEM_WB_Reg_Rd(WB_register),
        .EX_MEM_RegWrite(MEM_WB_regWrite),
        .MEM_WB_RegWrite(WB_regWrite),
        .Forward_ALU_A(forward_A),
        .Forward_ALU_B(forward_B),
        .Forward_C(forward_C),
        .Forward_D(forward_D)
    );
// MEM_WB_RegWrite
endmodule

// 3-to-1 MUX for forwarding
module Mux_32bit_3to1 (in00, in01, in10, mux_out, control);
	input [31:0] in00, in01, in10;
	output [31:0] mux_out;
	input [1:0] control;
	reg [31:0] mux_out;
	always @(in00 or in01 or in10 or control)
	begin
		case(control)
		2'b00:mux_out<=in00;
		2'b01:mux_out<=in01;
		2'b10:mux_out<=in10;
		default: mux_out<=in00;
		endcase
	end 
endmodule
`endif