`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:23:48 AM
// Design Name: 
// Module Name: Reg_File
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

/// REGISTER FILE ///
module Reg_File(
input CLK, RFWE,
input [4 : 0] RFRA1, RFRA2, RFWA, //5 - BIT : RFRA1 wires from rs  , RFRA2  wires from rt , RFWA wires from rd
input [31 : 0] RFWD,
output [31 : 0] RFRD1, RFRD2 //32 - BIT OUTPUTS, RFRD2 connects to ALU MUX
);
integer i;

reg [31 : 0] mem [0 : 31]; //32 memory array

initial begin
    for(i = 0; i < 32; i = i + 1)begin
        mem[i] = 0;
    end
end

always @(posedge CLK) begin

    if(RFWE == 1'b1)begin
    mem[RFWA] <= RFWD; //RFWE = high, then write RFWD into memory at RFWA address
    end
    
end

 assign  RFRD1 = mem[RFRA1];
 assign  RFRD2 = mem[RFRA2];


endmodule 
