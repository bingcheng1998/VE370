`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/09/2018 11:23:04 PM
// Design Name: 
// Module Name: pc
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


module program_counter(
    PC_in,PC_out,reset,clk
    );
    input [31:0] PC_in;
    output [31:0] PC_out;
    input reset, clk;
    reg [31:0] PC_out;
    always @(posedge clk)
    begin
        if(reset)
            begin
                PC_out <= 32'b0;
            end
        else PC_out <= PC_in[31:0];
    end    
endmodule
