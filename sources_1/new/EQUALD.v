`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 02:57:07 PM
// Design Name: 
// Module Name: EQUALD
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


module EQUALD(
input [31 : 0] RFMUX1,RFMUX2,

output reg EQ
    );
    
    always @(*) begin
        if(RFMUX1 == RFMUX2) begin
            EQ <= 1'b1;
       end
       
       else begin
            EQ <= 1'b0;
       end
       
    end
    
endmodule
