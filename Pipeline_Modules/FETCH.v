`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:26:30 AM
// Design Name: 
// Module Name: FETCH
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


module FETCH(
input CLK,EN,Flush,CLR,
input [31 : 0] IMRD,
input [31 : 0] PCp1,
output reg [31 : 0] InstrD,
output reg [31 : 0] PCp1D
);

initial begin
    InstrD <= 32'b0;
    PCp1D <= 32'b0;
end

always @(posedge CLK)begin
    
    if(!EN)begin
        if(Flush || CLR)begin
            InstrD <= 32'b0;
            PCp1D <= 32'b0;
        end
        
        else begin
            InstrD <= IMRD;
            PCp1D <= PCp1;
        end
        
    end
   
    
end


endmodule
