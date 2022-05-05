`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 03:15:49 PM
// Design Name: 
// Module Name: tb_RegFile
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


module tb_RegFile();

reg CLK, RFWE;
reg [4 : 0] RFRA1, RFRA2, RFWA; //5 - BIT : RFRA1 wires from rs  , RFRA2  wires from rt , RFWA wires from rd
reg [31 : 0] RFWD;
wire [31 : 0] RFRD1, RFRD2;

wire [31:0] RF = Top.RFRD1;

Reg_File UUT(.CLK(CLK),.RFWE(RFWE),.RFRA1(RFRA1),.RFRA2(RFRA2),.RFWA(RFWA),.RFWD(RFWD),.RFRD1(RFRD1),.RFRD2(RFRD2));

always begin
CLK = 0;
forever #10 CLK = ~CLK;
end

initial begin
RFWE = 1;

RFRA1 = 5'b00000;
RFRA2 = 5'b00000;
RFWA =  5'b00111;
#40;  

RFRA1 = 5'b00001;
RFRA2 = 5'b11111;
RFWA = 5'b00000;
#40;

RFRA1 = 5'b00011;
RFRA2 = 5'b11100;
RFWA = 5'b00010;
#40;

RFRA1 = 5'b00001;
RFRA2 = 5'b11111;
RFWA = 5'b00000;
#40;

RFWD = 5'b00010;

#40;

RFWD = 5'b00000;
#100;

$finish;
end

endmodule
