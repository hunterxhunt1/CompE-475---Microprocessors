`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:37:16 AM
// Design Name: 
// Module Name: JMUX
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


/// JUMP MUX ///
module JMUX (
input Jump,
input [31 : 0] PCJump,PCP,  //PCJump = {PC[31 : 26], Jaddr}
output reg [31 : 0] PCp2    //This is passed to PC IF jump instruction is called
);

always @(*) begin

    if(Jump == 1'b1) 
        PCp2 <= PCJump;
    
    else if (Jump == 1'b0) begin
        PCp2 <= PCP;        //Uses regular PC' if the jump instruction is not called
        end        

end

endmodule
