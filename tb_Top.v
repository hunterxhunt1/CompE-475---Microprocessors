`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 02:04:56 AM
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
    CLK <= 0;
    forever #10 CLK <= ~CLK;
end

initial begin
 RST = 1;
 #10;
 RST = 0;
 #800;
 $stop;
 end
 
 endmodule