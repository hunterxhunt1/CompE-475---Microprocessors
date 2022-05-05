`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:21:40 AM
// Design Name: 
// Module Name: Inst_Mem
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



/// INSTRUCTION MEMORY ///
module Inst_Mem(
input [31 : 0] IMA, //READS THE ADDRESS OF THE INSTRUCTION COMING IN (FETCHED ADDRESS)
output reg [31 : 0] IMRD); //coming out

reg [31 : 0] Mem [0: 31];

initial begin
 $readmemb("IM_data.mem",Mem);//data stored in Mem array are binary
end

always @(*) begin

 IMRD <= Mem[IMA];//this sends data to IMD from mem[IMA]
 //$writememb("IM_data.mem",Mem);

end

endmodule

//--------------------------------------------------------------------------------------------//