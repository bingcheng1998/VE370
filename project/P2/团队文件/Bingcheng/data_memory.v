`timescale 1ns / 1ps

module data_memory (
    input            clk,
    input            MemRead,
                 	 MemWrite,
    input    [31:0]  address,
                     write_data,
    output   [31:0]  read_data
);

    parameter        size = 64;	// size of data register_memory
    integer          i;
    wire     [31:0]  index;
    reg      [31:0]  register_memory [0:size-1];

    assign index = address >> 2; // address/4 


    initial begin
        for (i = 0; i < size; i = i + 1)
            register_memory[i] = 32'b0;
        read_data = 32'b0;
    end

    always @ ( posedge clk ) begin
        if (MemWrite == 1'b1) begin
            register_memory[index] = write_data;
        end
    end

    always @ ( negedge clk ) begin
        if (MemRead == 1'b1) begin
            read_data = register_memory[index];
        end
        else begin
         	read_data = 32'b0;
        end
    end
endmodule







