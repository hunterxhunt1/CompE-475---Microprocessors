`timescale 1ns / 1ps

/// PC ///
module PC(
input CLK,
input [31 : 0] PCP,
output [31 : 0] PCOut //32-BIT INSTRUCTION THAT IS FETCHED INTO INSTRUCTION MEMORY
);

reg [31 : 0] next;

initial begin
    next = 32'h00000000;
end

always @(posedge CLK) begin
    next <= PCP;        //Reads from PC' 
end

assign PCOut = next;    //Fetch address assogned to PCOut

endmodule
