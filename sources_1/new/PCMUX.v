`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:19:09 AM
// Design Name: 
// Module Name: PCMUX
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

/// PC MUX /// **Outputs PC'**
module PCMUX(
input PCSel,
input [31 : 0] PCp1, PCBranch,
output reg [31 : 0] PCP
);
   
   always @(*) begin
        
        //PCP uses the value of PCBranch if PCSel is 1
        if(PCSel == 1'b1)
            PCP <= PCBranch;
   
       
        //PCP uses the value of PCP1 if PCSel is zero
        else if(PCSel == 1'b0) begin
            PCP <= PCp1;
            end
    
   end// end always
    
endmodule