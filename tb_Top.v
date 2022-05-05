`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:24:08 AM
// Design Name: 
// Module Name: tb_Top
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

module tb_Top();

reg CLK, RST;

wire [31 : 0] IM [0 : 31] = Inst_Mem.Mem;
wire [31 : 0] RF [0 : 31] = Reg_File.mem;
wire [31 : 0] DM [0 : 399] = Data_Mem.mem;

Top DUT(.CLK(CLK),.RST(RST));

initial begin
    //CLK <= 0;
    forever #5 CLK <= ~CLK;
end

initial begin
CLK <= 0;
 RST <= 1;
 #3;
 RST <= 0;
 #4000;
 $stop;
 end
 
 endmodule