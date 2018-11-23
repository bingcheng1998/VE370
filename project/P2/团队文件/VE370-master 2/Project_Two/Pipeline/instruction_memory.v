`ifndef MODULE_INSTRUCTION_MEMORY
`define MODULE_INSTRUCTION_MEMORY

module instruction_memory (
    input       [31:0]  address,
    output      [31:0]  instruction
);

    parameter size = 128; // you can change here, size is the max size of memory
    integer i;
    // initialize memory
    reg [31:0] memory [0:size-1];
    // clear all memory to nop
    initial begin
        for (i = 0; i < size; i = i + 1)
            memory[i] = 32'b0;
        // include the instruction_memory
        `include "InstructionMem_for_P2_Demo.txt"
    end
    // Output the menmory at address
    assign instruction = memory[address >> 2];

endmodule
`endif
