`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2021 02:03:36 AM
// Design Name: 
// Module Name: Top
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


/// TOP MODULE ///

module Top( 
input CLK, RST                     // Clock and Reset timer
);

//wire [31 : 0] REG [31:0] = Reg_file.RFRA1;

wire [4 : 0] RFRA1, RFRA2;
wire [31 : 0] RFRD1,RFRD2,DMA,DMRD;

// CONTROL UNIT WIRES// - 10
wire MtoRFSel,DMWE,Branch,RFDSel,RFWE,Jump;
wire [5 : 0] opcode;
wire [5 : 0] funct;
wire [3 : 0] ALUSel;
wire ALUInSel;

// PC WIRES // - 7
wire PCSelOut;
wire Zero;
wire [31 : 0] PCOut,PCP,PCp2,PCp1,PCBranch,PCJump; //PCOut connects to IMA

// IM WIRES // - 2
wire [31 : 0] Inst;                     // inst = IMRD
wire [15 : 0] imm;                      // immediate
wire [31 : 0] simm;

// RF WIRES // - 4
wire [4 : 0] RFWA;
wire [4 : 0] rs,rt,rd;                  //rs = RFRA1, rt = RFRA2
wire [4 : 0] rtd;                       //output of RFMUX
wire [31 : 0] RFWD;

//ALU WIRES// - 9
//wire zero;                              //Connects to PCSel
wire [1 : 0] ALUOp;                    //Detects if it's lw, sw, or beq
wire [4 : 0] shamt;                     //shift amount
wire [31 : 0] ALUIn1,ALUIn2,ALUOut;
//wire [31 : 0] ALUMUX1,ALUMUX2;          //ALUMUX1 = RFRD2, ALUMUX2 = Simm
wire [31 : 0] ALUDMOut;                    //output of the ALUDM Mux

// DM WIRES // - 2
wire [31 : 0] DMOut;               //DMdIn = DMWD, which branches out from RFRD2

// JUMP WIRES // - 2
wire [25 : 0] Jaddr;                    //Jaddr = Inst[25 : 0]


PCMUX        DUT15(.PCSel(PCSelOut),.PCp1(PCp1),.PCBranch(PCBranch),.PCP(PCP));

JMUX         DUT16(.PCJump(PCJump),.Jump(Jump),.PCP(PCP),.PCp2(PCp2));

PC           DUT(.CLK(CLK),.PCP(PCp2),.PCOut(PCOut));

adder       DUT2(.PCOut(PCOut),.PCp1(PCp1));

Inst_Mem     DUT3(.IMA(PCOut),.IMRD(Inst));


/// ASSIGNING INSTRUCTION BIT VALUES ///
assign opcode = Inst[31 : 26];
assign rs = Inst [25 : 21];
assign rt = Inst [20 : 16];
assign rd = Inst [15 : 11];
assign imm = Inst [15 : 0];
assign shamt = Inst [10 : 6];
assign funct = Inst [5 : 0];
assign Jaddr = Inst [25 : 0];
assign PCJump = {PCOut[31 : 26], Jaddr};
//------------------------------------//

RFMUX        DUT12(.RFDSel(RFDSel),.rt(rt),.rd(rd),.rtd(rtd));

Reg_File     DUT4(.CLK(CLK),.RFWE(RFWE),.RFRA1(rs),.RFRA2(rt),.RFWA(rtd),.RFWD(RFWD),.RFRD1(RFRD1),.RFRD2(RFRD2));

SE           DUT5(.imm(imm),.simm(simm));

ALUMUX       DUT10(.RFRD2(RFRD2),.simm(simm),.ALUInSel(ALUInSel),.ALUIn2(ALUIn2));

ALU          DUT6(.ALUIn1(RFRD1),.ALUIn2(ALUIn2),.ALUSel(ALUSel),.shamt(shamt),.ALUOut(ALUOut),.Zero(Zero));

PCAdder      DUT14(.simm(simm),.PCp1(PCp1),.PCBranch(PCBranch));

PCSel        DUT13(.Zero(Zero),.Branch(Branch),.PCSel(PCSelOut));

Data_Mem     DUT7(.CLK(CLK),.DMWE(DMWE),.DMA(ALUOut),.DMWD(RFRD2),.DMRD(DMOut));

ALUDM        DUT11(.MtoRFSel(MtoRFSel),.ALUOut(ALUOut),.DMOut(DMOut),.ALUDMOut(ALUDMOut));

Control_Unit DUT8(.RST(RST),.opcode(opcode),.MtoRFSel(MtoRFSel),.DMWE(DMWE),.Branch(Branch),.ALUInSel(ALUInSel),.RFDSel(RFDSel),.RFWE(RFWE),.Jump(Jump),.ALUOp(ALUOp));

ALU_Decoder  DUT9(.ALUOp(ALUOp),.funct(funct),.ALUSel(ALUSel));

/// ASSIGNING CORRECT NAMES TO WIRES ///
assign RFRA1 = rs;
assign RFRA2 = rt;
assign RFWA = rtd;
assign RFWD = ALUDMOut;
assign ALUIn1 = RFRD1;
//assign RFRD1 = ALUIn1;
//assign RFRD2 = ALUMUX1;
//assign ALUMUX1 = DMdIn;
assign DMA = ALUOut;
assign DMRD = DMOut;

//------------------------------------//

endmodule