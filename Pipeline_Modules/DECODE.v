`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:57:42 AM
// Design Name: 
// Module Name: DECODE
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


module DECODE(
input CLK,Flush,
input [4 : 0]  rs,rt,rd,
input [31 : 0] RFRD1,RFRD2,
input [31 : 0] simm,
//input [31 : 0] PCp1D,

input RFWE,MtoRFSel,DMWE,Branch,ALUInSel,RFDSel,Jump,
input [3 : 0] ALUSel,

output reg [4 : 0] rsE,rtE,rdE,
output reg [31 : 0] RFRD1E,
output reg [31 : 0] RFRD2E,
output reg[31 : 0] simmE,
//output reg [31 : 0] PCp1E,

output reg RFWEE,MtoRFSelE,DMWEE,BranchE,ALUInSelE,RFDSelE,JumpE,
output reg  [3 : 0] ALUSelE
    );
    initial begin
    rsE <= 5'b0;
    rtE <= 5'b0;
    rdE <= 5'b0;
    RFRD1E <= 32'b0;
    RFRD2E <= 32'b0;
    simmE <= 32'b0;
    //PCp1E <= 32'b0;
    
    //CONTROL UNIT//
    RFWEE <= 1'b0;
    MtoRFSelE <= 1'b0;
    DMWEE <= 1'b0;
    BranchE <= 1'b0;
    ALUInSelE <= 1'b0;
    ALUSelE <= 4'b0;
    RFDSelE <= 1'b0;  
    JumpE <= 1'b0;  
    end
    
    always @(posedge CLK)begin
    
    if (Flush == 1'b1) begin 
    rsE <= 5'b0;
    rtE <= 5'b0;
    rdE <= 5'b0;
    RFRD1E <= 32'b0;
    RFRD2E <= 32'b0;
    simmE <= 32'b0;
    //PCp1E <= 32'b0;
   
   
    //CONTROL UNIT//
    RFWEE <= 1'b0;
    MtoRFSelE <= 1'b0;
    DMWEE <= 1'b0;
    BranchE <= 1'b0;
    ALUInSelE <= 1'b0;
    ALUSelE <= 4'b0;
    RFDSelE <= 1'b0;  
    JumpE <= 1'b0;  
    
    end
    
    else begin
    rsE <= rs;
    rtE <= rt;
    rdE <= rd;
    RFRD1E <= RFRD1;
    RFRD2E <= RFRD2;
    simmE <= simm;
    //PCp1E <= PCp1D;
    
    //CONTROL UNIT//
    RFWEE <= RFWE;
    MtoRFSelE <= MtoRFSel;
    DMWEE <= DMWE;
    BranchE <= Branch;
    ALUInSelE <= ALUInSel;
    ALUSelE <= ALUSel;
    RFDSelE <= RFDSel;  
    JumpE <= Jump;  
    
    end
    
    end
    
endmodule
