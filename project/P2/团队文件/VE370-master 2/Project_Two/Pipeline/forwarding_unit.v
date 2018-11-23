`ifndef MODULE_FORWARDING
`define MODULE_FORWARDING
`timescale 1ns / 1ps
module Forwarding(
    // *****INPUT******
    // Input Register
    input   [4:0]   ID_EX_Reg_Rt,
                    ID_EX_Reg_Rs,
                    IF_ID_Reg_Rs,
                    IF_ID_Reg_Rt,
                    EX_MEM_Reg_Rd,
                    MEM_WB_Reg_Rd,
    // Input control signal
    input           EX_MEM_RegWrite,
                    MEM_WB_RegWrite,
    // *****OUTPUT*****
    //  Forward for ALU input
    output  reg [1:0]   Forward_ALU_A,
                        Forward_ALU_B,
    //  Forward for state reg input
    output  reg     Forward_C,
                    Forward_D
);

    always @(*)
        begin
            if(EX_MEM_RegWrite && (EX_MEM_Reg_Rd != 0) && (EX_MEM_Reg_Rd == ID_EX_Reg_Rs))
                Forward_ALU_A = 2'b10;
            // ID_EX for ALU
            else if(MEM_WB_RegWrite && (MEM_WB_Reg_Rd != 0) && (MEM_WB_Reg_Rd == ID_EX_Reg_Rs))
                Forward_ALU_A = 2'b01;
            // MEM_WB for ALU
            else
                Forward_ALU_A = 2'b00;
            // Regsiter for ALU

            if(EX_MEM_RegWrite && (EX_MEM_Reg_Rd != 0) && (EX_MEM_Reg_Rd == ID_EX_Reg_Rt))
                Forward_ALU_B = 2'b10;
            else if(MEM_WB_RegWrite && (MEM_WB_Reg_Rd != 0) && (MEM_WB_Reg_Rd == ID_EX_Reg_Rt))
                Forward_ALU_B = 2'b01;
            else
                Forward_ALU_B = 2'b00;

            //Select the data input of ID_EX_State_reg
            if(EX_MEM_RegWrite && (MEM_WB_Reg_Rd != 0) && (MEM_WB_Reg_Rd == IF_ID_Reg_Rs))
                Forward_C = 1;
            else
                Forward_C = 0;
                
            if(EX_MEM_RegWrite && (MEM_WB_Reg_Rd != 0) && (MEM_WB_Reg_Rd == IF_ID_Reg_Rt))
                Forward_D = 1;
            else
                Forward_D = 0;
        end
endmodule
`endif