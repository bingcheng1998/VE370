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
    reg [31:0] longOutput;
    always @(shortInput)
    begin
        if (shortInput[15] == 0) assign longOutput = {{16'b0}:shortInput[15:0]};
        else if (shortInput[15] == 1) assign longOutput = {{4'hFFFF}:shortInput[15:0]};
    end
endmodule
