`ifndef MODULE_HAZARD
`define MODULE_HAZARD
`timescale 1ns / 1ps

module hazard_detection(
    // Stall for lw 
    // If ID/EX.Memread and ((ID/EX.Rt == IF/ID.Rs) or ID/EX.Rt == IF/ID.Rt)
    // Stall the pipe line.
    // If beq or bne and lw detected at the same time, the pipeline have to be stalled till the MEM stage.
    // If ins_beq or ins_bne:
    //     if EX.regwirte and  registerRdEX and EX/MEM.Rd == ID/EX.Rs or EX/MEM.Rd == ID/EX.Rt
    input [4:0] ID_Reg_Rt, 
                IF_Reg_Rs, 
                IF_Reg_Rt,

    input       EX_MemRead,
                EX_regWirte,
                MEM_MemRead,
                Ins_Beq,
                Ins_Bne,
    
    output  reg     stall,
                    flush
);
    initial begin
        stall = 1'b0;
        flush = 1'b0;
    end

    always @(*) begin
        if(EX_MemRead&& ID_Reg_Rt&& ((ID_Reg_Rt == IF_Reg_Rs) || (ID_Reg_Rt == IF_Reg_Rt)))
        begin
            stall = 1'b1;
            flush = 1'b1;
        end else if(Ins_Beq || Ins_Bne) begin
            if(EX_regWirte && ID_Reg_Rt&&((ID_Reg_Rt == IF_Reg_Rs) || (ID_Reg_Rt == IF_Reg_Rt))) begin
                stall = 1'b1;
                flush = 1'b1;
            end else if (MEM_MemRead &&ID_Reg_Rt&& ((ID_Reg_Rt == IF_Reg_Rs) || (ID_Reg_Rt == IF_Reg_Rt))) begin
                stall = 1'b1;
                flush = 1'b1;
            end else begin
                stall = 1'b1;
                flush = 1'b1;                
            end
        end else begin
            stall = 1'b0;
            flush = 1'b0;
        end
    end
endmodule




`endif