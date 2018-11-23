`ifndef MODULE_CONTROL
`define MODULE_CONTROL
`timescale 1ns / 1ps

module Control (
    input       [5:0]   op_code,
    output reg  [1:0]   ALUOp,
    output reg  RegDst,
                Jump,
                Branch,
                MemRead,
                MemtoReg,
                MemWrite,
                ALUSrc,
                RegWrite
);

    initial begin
        RegDst      = 1'b0;
        Jump        = 1'b0;
        Branch      = 1'b0;
        MemRead     = 1'b0;
        MemtoReg    = 1'b0;
        MemWrite    = 1'b0;
        ALUSrc      = 1'b0;
        RegWrite    = 1'b0;
        ALUOp       = 2'b00;
    end

    always @ ( op_code ) begin
        case (op_code)
            6'b000000: begin // R-type
                RegDst      <= 1'b1;
                Jump        <= 1'b0;
                Branch      <= 1'b0;
                MemRead     <= 1'b0;
                MemtoReg    <= 1'b0;
                MemWrite    <= 1'b0;
                ALUSrc      <= 1'b0;
                RegWrite    <= 1'b1;
                ALUOp       <= 2'b10;
            end
            6'b000010: begin // j
                RegDst      <= 1'b1;
                Jump        <= 1'b1;
                Branch      <= 1'b0;
                MemRead     <= 1'b0;
                MemtoReg    <= 1'b0;
                MemWrite    <= 1'b0;
                ALUSrc      <= 1'b0;
                RegWrite    <= 1'b0;
                ALUOp       <= 2'b10;
			end
            6'b000100: begin // beq
                RegDst      <= 1'b1;
                Jump        <= 1'b0;
                Branch      <= 1'b1;
                MemRead     <= 1'b0;
                MemtoReg    <= 1'b0;
                MemWrite    <= 1'b0;
                ALUSrc      <= 1'b0;
                RegWrite    <= 1'b0;
                ALUOp       <= 2'b01;
            end
            6'b000100: begin // bne
                RegDst      <= 1'b1;
                Jump        <= 1'b0;
                Branch      <= 1'b0;
                MemRead     <= 1'b0;
                MemtoReg    <= 1'b0;
                MemWrite    <= 1'b0;
                ALUSrc      <= 1'b0;
                RegWrite    <= 1'b0;
                ALUOp       <= 2'b01;
            end
            6'b001000: begin // addi
                RegDst      <= 1'b0;
                Jump        <= 1'b0;
                Branch      <= 1'b0;
                MemRead     <= 1'b0;
                MemtoReg    <= 1'b0;
                MemWrite    <= 1'b0;
                ALUSrc      <= 1'b1;
                RegWrite    <= 1'b1;
                ALUOp       <= 2'b00;
            end
            6'b001100: begin // andi
                RegDst      <= 1'b0;
                Jump        <= 1'b0;
                Branch      <= 1'b0;
                MemRead     <= 1'b0;
                MemtoReg    <= 1'b0;
                MemWrite    <= 1'b0;
                ALUSrc      <= 1'b1;
                RegWrite    <= 1'b1;
                ALUOp       <= 2'b11;
            end
            6'b100011: begin // lw
                RegDst      <= 1'b0;
                Jump        <= 1'b0;
                Branch      <= 1'b0;
                MemRead     <= 1'b1;
                MemtoReg    <= 1'b1;
                MemWrite    <= 1'b0;
                ALUSrc      <= 1'b1;
                RegWrite    <= 1'b1;
                ALUOp       <= 2'b00;
			end
            6'b101011: begin // sw
                RegDst      <= 1'b0;
                Jump        <= 1'b0;
                Branch      <= 1'b0;
                MemRead     <= 1'b0;
                MemtoReg    <= 1'b0;
                MemWrite    <= 1'b1;
                ALUSrc      <= 1'b1;
                RegWrite    <= 1'b0;
                ALUOp       <= 2'b00;
			end

            default: ;
        endcase
    end

endmodule
`endif

