`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2018 01:31:51 AM
// Design Name: 
// Module Name: ALU_control
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU_control(
    funct,ALUOp,ALUCtrl
    );
    input [5:0] funct;
    input [1:0] ALUOp;
    output [3:0] ALUCtrl;
    reg [3:0] ALUCtrl;
    always @ (funct or ALUOp)
    begin
        case(ALUOp)
            2'b00: assign ALUCtrl = 4'b0010;
            2'b01: assign ALUCtrl = 4'b0110;
            2'b10:
                begin
                    if (funct == 6'b100000)      assign ALUCtrl = 4'b0010;
                    else if (funct == 6'b100010) assign ALUCtrl = 4'b0110;
                    else if (funct == 6'b100100) assign ALUCtrl = 4'b0000;
                    else if (funct == 6'b100101) assign ALUCtrl = 4'b0001;
                    else if (funct == 6'b101010) assign ALUCtrl = 4'b0111;
                end
            default: assign ALUCtrl = 4'b1111;
        endcase
    end
endmodule
