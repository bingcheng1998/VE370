`ifndef MODULE_SIGN_EXT
`define MODULE_SIGN_EXT
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2018 01:51:01 AM
// Design Name: 
// Module Name: sign_extension
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


module sign_extension(
    shortInput, longOutput
    );
    input [15:0] shortInput;
    output [31:0] longOutput;
    // reg [31:0] longOutput;
    assign longOutput[15:0] = shortInput[15:0];
    assign longOutput[31:16] = shortInput[15]?16'b1111_1111_1111_1111:16'b0;
endmodule
`endif