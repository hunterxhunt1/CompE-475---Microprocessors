`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 01:13:22 AM
// Design Name: 
// Module Name: HAZARD
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


module HAZARD(
input [4 : 0] rsD, rtD,
input [4 : 0] rsE,rtE, rtdE,
input [4 : 0] rtdM,
input [4 : 0] rtdW,
input MtoRFSelE,
input MtoRFSelM,
input RFWEE,
input RFWEM,
input RFWEW,
input BranchD,
input JumpD,

output reg ForwardAD,ForwardBD,
output reg [1 : 0] ForwardAE,ForwardBE,
output reg Stall,Flush
    );
/*
parameter LWOPCODE = 6'b100011; 
parameter BEQOPCODE = 6'b000100;
*/

reg LWStall, BRStall,JStall;

initial begin
    ForwardAE = 2'b00;          // ASSOCIATED WITH ALUIN1
    ForwardBE = 2'b00;          // ASSOCIATED WITH ALUIN2E
    ForwardAD = 1'b0;           // ASSOCIATED WITH RFRD1 MUX
    ForwardBD = 1'b0;           // ASSOCIATED WITH RFRD2 MUX
    
    Stall = 1'b0;
    Flush = 1'b0;   
    
    LWStall = 1'b0;           
    BRStall = 1'b0;
end
    
    // FORWARDING //
    always @(*)begin
 
    
   //BRStall <= ((rsD == rtdE) || (rtD == rtdE)) && (BranchD) && (RFWEE) || ((rsD == rtdM) || (rtD == rtdM)) && (BranchD) && (MtoRFSelM);
   
   if((((rsD == rtdE) || (rtD == rtdE)) && (BranchD) && (RFWEE)) ||
      (((rsD == rtdM) || (rtD == rtdM)) && (BranchD) && (MtoRFSelM)))begin
    BRStall <= 1'b1;
   end
   
   else begin 
    BRStall <= 1'b0;
   end
   
   //LWStall <= (MtoRFSelE) && ((rtE == rsD) || (rtE == rtD));
   
   if((MtoRFSelE) && ((rtE == rsD) || (rtE == rtD)))begin
    LWStall <= 1'b1;
   end
   
   else begin
    LWStall <= 1'b0;
   end
   
   if(JumpD == 1'b1)begin
    JStall <= 1'b1;
   end
   
   else begin
    JStall <= 1'b0;
   end
   
    //JStall <= JumpD;
    Stall <= LWStall || BRStall;
    Flush <= LWStall || BRStall || JStall;
    
    if((rsD != 0) && (rsD == rtdM) && (RFWEM))begin
        ForwardAD <= 1'b1;
    end
    
    else begin
        ForwardAD <= 1'b0;
    end
    
    if((rsD != 0) && (rtD == rtdM) && (RFWEM))begin
        ForwardBD <= 1'b1;
    end
    
    else begin
        ForwardBD <= 1'b0;
    end
    
    //ForwardAD <= (rsD != 0) && (rsD == rtdM) && (RFWEM);
    //ForwardBD <= (rsD != 0) && (rtD == rtdM) && (RFWEM); 
    
    
    //FORWARDING AE
    if((rsE != 0) && (RFWEM)  && (rsE == rtdM))begin
        ForwardAE <= 2'b10;
    end
   
    else if((rsE != 0) && (RFWEW) && (rsE == rtdW))begin
        ForwardAE <= 2'b01;
    end
    
    else begin
        ForwardAE <= 2'b00;
    end
    
    //FORWARDING BE
    if((rtE != 0) && (RFWEM) && (rtE == rtdM))begin
        ForwardBE <= 2'b10;
    end
    
    else if((rtE != 0) && (RFWEW) && (rtE == rtdW))begin
         ForwardBE <= 2'b01;
    end
    
    else begin
        ForwardBE <= 2'b00;
    end
    
   
    
    end 

    
endmodule
