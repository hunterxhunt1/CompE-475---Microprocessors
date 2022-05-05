`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:33:13 AM
// Design Name: 
// Module Name: Control_Unit
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


/// CONTROL UNIT ///

module Control_Unit(
input RST,
input [5 : 0] opcode, //6-bits opcode
output reg MtoRFSel,DMWE,Branch,ALUInSel,RFDSel,RFWE,Jump,
output reg [1 : 0] ALUOp
);
 
always @(opcode) begin
/*
    if(RST == 1'b1)begin
             MtoRFSel = 1'b1;
            DMWE = 1'b0;
            Branch = 1'b0;
            ALUInSel = 1'b1;
            RFDSel = 1'b0;
            RFWE = 1'b1;
            ALUOp = 2'b00;
            Jump = 1'b0;
    end
    
    else begin
    */
    case(opcode)
        
        6'b100011: begin    //LOAD WORD (LW)
            MtoRFSel = 1'b1;
            DMWE = 1'b0;
            Branch = 1'b0;
            ALUInSel = 1'b1;
            RFDSel = 1'b0;
            RFWE = 1'b1;
            ALUOp = 2'b00;
            Jump = 1'b0;
        end
        
        6'b101011: begin    //STORE WORD (SW)
            MtoRFSel = 1'bx;
            DMWE = 1'b1;
            Branch = 1'b0;
            ALUInSel = 1'b1;
            RFDSel = 1'bx;
            RFWE = 1'b0;
            ALUOp = 2'b00;
            Jump = 1'b0;
        end
        
        6'b000000: begin    //R-TYPE
            MtoRFSel = 1'b0;
            DMWE = 1'b0;
            Branch = 1'b0;
            ALUInSel = 1'b0;
            RFDSel = 1'b1;
            RFWE = 1'b1;
            ALUOp = 2'b10;
            Jump = 1'b0;
        end
        
        6'b000100: begin    //BEQ INSTRUCTION: compares rs and rt. If rs = rt, it takes the branch by adding sign extended offset Simm to PC.
            MtoRFSel = 1'bx;
            DMWE = 1'b0;
            Branch = 1'b1;
            ALUInSel = 1'b0;
            RFDSel = 1'bx;
            RFWE = 1'b0;
            ALUOp = 2'b01;
            Jump = 1'b0;
        end
        
        6'b001000: begin    //addi
            MtoRFSel = 1'b0;
            DMWE = 1'b0;
            Branch = 1'b0;
            ALUInSel = 1'b1;
            RFDSel = 1'b0;
            RFWE = 1'b1;
            ALUOp = 2'b00;
            Jump = 1'b0;
        end
        
        6'b000010: begin    //JUMP INSTRUCTION
            MtoRFSel = 1'bx;
            DMWE = 1'b0;
            Branch = 1'bx;
            ALUInSel = 1'bx;
            RFDSel = 1'bx;
            RFWE = 1'b0;
            ALUOp = 2'bxx;
            Jump = 1'b1;
        end
    endcase
    //end

end //end of always


endmodule