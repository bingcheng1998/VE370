`ifndef MODULE_ALU
`define MODULE_ALU
`timescale 1ns / 1ps

module ALU (
    input       [3:0]   ALUCtrl,
    input       [31:0]  a, b,
    output              zero,
    output reg  [31:0]  ALU_result
);

    assign zero = (ALU_result == 0);

    initial begin
        ALU_result = 32'b0;
    end

    always @ ( ALUCtrl, a, b ) begin
        case (ALUCtrl)
            4'b0000: // AND
                ALU_result = a & b;
            4'b0001: // OR
                ALU_result = a | b;
            4'b0010: // ADD
                ALU_result = a + b;
            4'b0110: // SUB
                ALU_result = a - b;
            4'b0111: // SLT
                ALU_result = (a < b) ? 1 : 0;
            4'b1100: // NOR
                ALU_result = ~(a | b);
            default: ;
        endcase
    end

endmodule // ALU

`endif // MODULE_ALU
