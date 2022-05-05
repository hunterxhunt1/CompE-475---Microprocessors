`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 02:23:05 AM
// Design Name: 
// Module Name: EXECUTE
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


module EXECUTE(
input CLK,Zero,
input [4 : 0] rtd,
input [31 : 0] ALUOut,
input [31 : 0] DMdInE,
//input [31 : 0] PCBranch,
input RFWEE,MtoRFSelE,DMWEE,BranchE,JumpE,

output reg ZeroM,
output reg [4 : 0] rtdM,
output reg [31 : 0] ALUOutM,
output reg [31 : 0] DMdInM,
//output reg [31 : 0] PCBranchM,
output reg RFWEM,MtoRFSelM,DMWEM,BranchM,JumpM
    );
    
    initial begin
        ZeroM <= 1'b0;
        rtdM <= 5'b0;
        ALUOutM <= 32'b0;
        DMdInM <= 32'b0;
        //PCBranchM <= 32'b0;
        
        //CONTROL UNIT MEM//
        RFWEM <= 1'b0;
        MtoRFSelM <= 1'b0;
        DMWEM <= 1'b0;
        BranchM <= 1'b0;
        JumpM <= 1'b0;
    
    end
    
    always @(posedge CLK) begin
        ZeroM <= Zero;
        rtdM <= rtd;
        ALUOutM <= ALUOut;
        DMdInM <= DMdInE;
        //PCBranchM <= PCBranch;
        
        //CONTROL UNIT MEM//
        RFWEM <= RFWEE;
        MtoRFSelM <= MtoRFSelE;
        DMWEM <= DMWEE;
        BranchM <= BranchE;
        JumpM <= JumpE;
    
    end
    
    
endmodule
