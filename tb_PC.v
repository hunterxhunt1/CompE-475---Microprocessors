`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 12:38:24 AM
// Design Name: 
// Module Name: tb_PC
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


module tb_PC();

reg CLK;
reg [31 : 0] PCP;

wire [31 : 0] PCOut;

PC UUT(.CLK(CLK),.PCP(PCP),.PCOut(PCOut));

always begin
CLK = 0;
forever #10 CLK = ~CLK;
end

initial begin
    PCP <= 32'h00000000; #10;
    #10;
    PCP <= 32'h00000001; #10;
    #10;
    PCP <= 32'h00000002; #10;
    #10;
    PCP <= 32'h00000003; #10;
    #10;
    PCP <= 32'h00000004; #10;
    #10;
    PCP <= 32'h00000005; #10;
    #10;
   
end


endmodule
