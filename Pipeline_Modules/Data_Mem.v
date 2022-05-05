`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:16:36 AM
// Design Name: 
// Module Name: Data_Mem
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




/// DATA MEMORY ///
module Data_Mem(
input CLK,DMWE,
input [31 : 0] DMA, DMWD, //DMWD is connected to RFRD2
output [31 : 0] DMRD
);

reg [31 : 0] mem [0 : 399];//32-bit array
//integer i;

initial begin
//for(i = 0; i < 256; i = i + 1) begin
//    mem[i] = 0;
//end
//$readmemb("DM.mem", mem);

    mem[0] = 17;
    mem[1] = 31;
    mem[2] = -5;
    mem[3] = -2;
    mem[4] = 250;
//$writememb("DM.mem",mem);
end

assign DMRD = mem[DMA];

always @(posedge CLK) begin
  if(DMWE == 1'b1) begin
  mem[DMA] = DMWD;//if DMWE is high, it writes data DMWD into address DMA
  //$writememb("DM.mem",mem);
  end

end


endmodule
