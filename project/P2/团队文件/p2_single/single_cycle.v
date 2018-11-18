`ifndef MODULE_SINGLE_CYCLE
`define MODULE_SINGLE_CYCLE
`include "adder.v"
`include "ALU_control.v"
`include "ALU.v"
`include "control.v"
`include "data_memory.v"
`include "instruction_memory.v"
// `include "memory.v"
`include "program_counter.v"
`include "register.v"
`include "sign_extension.v"
`include "Mux_N_bit.v"

module single_cycle(clk,reset);
    input clk;
    input reset;
    // PC Signals
    wire [31:0] PC_in, PC_out, PC_plus_four;
    // Instructions memory signals
    wire [31:0] Instructions;
    // Regsiter signals
    wire [31:0] write_data,reg_read_data_1,reg_read_data_2;
    wire [4:0] write_address;
    // ALU  
    wire [31:0] ALU_a,ALU_b,ALU_out;
    wire [3:0] ALU_control;
    wire output_zero;
    assign ALU_a = reg_read_data_1;
    // D-mem 
    wire [31:0] D_MEM_read_data;
    // Control
	wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	wire [1:0] ALUOp;
	wire [3:0] ALU_control_out;
    // Branch
    wire [31:0] extended_imm,shifted_imm,branch_result,branch_out;
    wire branch_mux;
    assign branch_mux = output_zero & Branch;
    // Jump
    wire [31:0] jump_addr;
    // PC + 4[31:28]
    assign jump_addr = {PC_plus_four[31:28],Instructions[25:0],2'b0};
    assign branch_out = PC_plus_four + (extended_imm<<2);
    // Connect PC
    program_counter PC(
        .PC_in(PC_in),
        .PC_out(PC_out),
        .reset(reset),
        .clk(clk)
    );
    // Cal PC + 4
    adder add_PC_by_four(
        .a(PC_out),
        .b(32'b0100),
        .sum(PC_plus_four)
    );
    // Get instruction
    instruction_memory get_ins(
        .address(PC_out),
        .instruction(Instructions)
    );
    // Read Register 
    Registers get_reg(
        .read_register_1(Instructions[25:21]),
        .read_register_2(Instructions[20:16]),
        .regWrite(RegWrite),
        .write_register(write_address),
        .write_data(write_data),
        .read_data_1(reg_read_data_1),
        .read_data_2(reg_read_data_2),
        .clk(clk)
    );
    // ALU
    ALU alu(
        .ALUCtrl(ALU_control_out),
        .a(ALU_a),
        .b(ALU_b),
        .ALU_result(ALU_out),
        .zero(output_zero)
    );
    // Control 
    Control con(
        .op_code(Instructions[31:26]),
        .RegDst(RegDst),
        .Branch(Branch),
        .Jump(Jump),
        .MemRead(MemRead),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp)
    );
    // ALU control
    ALU_control alu_ctrl(
        .funct(Instructions[5:0]),
        .ALUOp(ALUOp),
        .ALUCtrl(ALU_control_out)
    );
    // Sign_extension
    sign_extension sign_ext(
        .shortInput(Instructions[15:0]),
        .longOutput(extended_imm)
    );
    // Data memory
    data_memory dm(
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .address(ALU_out),
        .write_data(reg_read_data_2),
        .read_data(D_MEM_read_data)
    );

    // Mux
    Mux_N_bit#(5) mux_select_write_reg(
        .in1(Instructions[20:16]),
        .in2(Instructions[15:11]),
        .select(RegDst),
        .out(write_address)
    );
    Mux_N_bit#(32) mux_select_ALU_in(
        .in1(reg_read_data_2),
        .in2(extended_imm),
        .select(ALUSrc),
        .out(ALU_b)
    );
    assign write_data = (MemtoReg == 1'b0) ? ALU_out:D_MEM_read_data;
    Mux_N_bit#(32) mux_select_PC_one(
        .in1(PC_plus_four),
        .in2(branch_out),
        .select(branch_mux),
        .out(branch_result)
    );
    assign PC_in = (Jump == 1'b0) ? branch_result:jump_addr;
endmodule
`endif


