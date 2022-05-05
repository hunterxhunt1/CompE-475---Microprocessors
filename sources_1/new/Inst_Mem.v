`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:17:07 AM
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

  IMRD <= Mem[IMA >> 2];//this sends data to IMD from mem[IMA]

end

endmodule