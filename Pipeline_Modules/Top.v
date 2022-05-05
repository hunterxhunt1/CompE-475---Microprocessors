`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 01:22:34 AM
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
wire [31 : 0] IMRD;
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


/// PIPELINE WIRES ////

//FETCH
//wire [31 : 0] InstrD;
wire [31 : 0] PCp1D;

//DECODE
wire [4 : 0] rsE,rtE,rdE;
wire [31 : 0] RFRD1E;
wire [31 : 0] RFRD2E;
wire [31 : 0] ALUIn1E;
wire [31 : 0] DMdInE;
wire [31 : 0] simmE;
wire [31 : 0] PCp1E;
wire RFWEE,MtoRFSelE,DMWEE,BranchE,ALUInSelE,RFDSelE,JumpE;
wire[3 : 0] ALUSelE;
wire [31 : 0] RFMUX1,RFMUX2;
wire EQ;


//MEMORY
wire ZeroM;
wire [4 : 0] rtdM;
wire [31 : 0] ALUOutM;
wire [31 : 0] DMdInM;
wire [31 : 0] PCBranchM;
wire RFWEM,MtoRFSelM,DMWEM,BranchM,JumpM;

//WRITEBACK
wire [31 : 0] ALUOutW;
wire  [31 : 0] DMOutW;
wire [4 : 0] rtdW;
wire RFWEW,MtoRFSelW,JumpW;

//HAZARD
wire [1 : 0] ForwardAE,ForwardBE;
wire ForwardAD,ForwardBD;
wire Flush;
wire EN;



///////////////////////

PCMUX        DUT15(.PCSel(PCSelOut),.PCp1(PCp1),.PCBranch(PCBranch),.PCP(PCP));

JMUX         DUT16(.PCJump(PCJump),.Jump(Jump),.PCP(PCP),.PCp2(PCp2));

PC           DUT(.CLK(CLK),.EN(EN),.PCP(PCp2),.PCOut(PCOut));

adder        DUT2(.PCOut(PCOut),.PCp1(PCp1));

Inst_Mem     DUT3(.IMA(PCOut),.IMRD(IMRD));

FETCH        DUT17 (.CLK(CLK),.EN(EN),.Flush(PCSelOut),.CLR(Jump),.IMRD(IMRD),.PCp1(PCp1),
                            // OUTPUT //
                    .PCp1D(PCp1D),.InstrD(Inst));

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

Control_Unit DUT8(.RST(RST),.opcode(opcode),
                                                   // OUTPUT //
                  .MtoRFSel(MtoRFSel),.DMWE(DMWE),.Branch(Branch),
                  .ALUInSel(ALUInSel),.RFDSel(RFDSel),.RFWE(RFWE),.Jump(Jump),.ALUOp(ALUOp));

ALU_Decoder  DUT9(.ALUOp(ALUOp),.funct(funct),.ALUSel(ALUSel));


Reg_File     DUT4(.CLK(CLK),.RFWE(RFWEW),.RFRA1(rs),.RFRA2(rt),.RFWA(rtdW),.RFWD(RFWD),.RFRD1(RFRD1),.RFRD2(RFRD2));

RFRD1_MUX    DUT25(.RFRD1(RFRD1),.ALUOutM(ALUOutM),.ForwardAD(ForwardAD),.RFMUX1(RFMUX1));

RFRD2_MUX    DUT26(.RFRD2(RFRD2),.ALUOutM(ALUOutM),.ForwardBD(ForwardBD),.RFMUX2(RFMUX2));

EQUALD       DUT27(.RFMUX1(RFMUX1),.RFMUX2(RFMUX2),.EQ(EQ));

PCSel        DUT13(.Zero(EQ),.Branch(Branch),.PCSel(PCSelOut));

SE           DUT5(.imm(imm),.simm(simm));

PCAdder      DUT14(.simm(simm),.PCp1(PCp1D),.PCBranch(PCBranch));

//LOL THIS IS SUPPOSE TO BE EXECUTE//
DECODE       DUT18 (.CLK(CLK),.Flush(Flush),.rs(rs),.rt(rt),.rd(rd),.RFRD1(RFRD1),.RFRD2(RFRD2),.simm(simm),
            .MtoRFSel(MtoRFSel),.DMWE(DMWE),.Branch(Branch),.ALUInSel(ALUInSel),.ALUSel(ALUSel),.RFDSel(RFDSel),
            .RFWE(RFWE),.Jump(Jump),
                                                      // OUTPUT //
            .rsE(rsE),.rtE(rtE),.rdE(rdE),.RFRD1E(RFRD1E),
            .RFRD2E(RFRD2E),.simmE(simmE),.MtoRFSelE(MtoRFSelE),.DMWEE(DMWEE),
            .BranchE(BranchE),.ALUInSelE(ALUInSelE),.ALUSelE(ALUSelE),.RFDSelE(RFDSelE),.RFWEE(RFWEE),.JumpE(JumpE));
//wire [31 : 0]simmSL;

//SHIFT_LEFT   DUT28(.simm(simm),.simmSL(simmSL));

AE_MUX       DUT23 (.ForwardAE(ForwardAE),.RFRD1E(RFRD1E),.ALUDMOut(ALUDMOut),.ALUOutM(ALUOutM),.ALUIn1E(ALUIn1E));

BE_MUX       DUT24 (.ForwardBE(ForwardBE),.RFRD2E(RFRD2E),.ALUDMOut(ALUDMOut),.ALUOutM(ALUOutM),.DMdInE(DMdInE));

ALUMUX       DUT10(.RFRD2(DMdInE),.simm(simmE),.ALUInSel(ALUInSelE),.ALUIn2(ALUIn2));

RFMUX        DUT12(.RFDSel(RFDSelE),.rt(rtE),.rd(rdE),.rtd(rtd));

EXECUTE      DUT19 (.CLK(CLK),.Zero(Zero),.rtd(rtd),.ALUOut(ALUOut),.DMdInE(DMdInE),
                    .MtoRFSelE(MtoRFSelE),.DMWEE(DMWEE),
                    .BranchE(BranchE),.RFWEE(RFWEE),.JumpE(JumpE),
                                                    // OUTPUT //
                    .ZeroM(ZeroM),.rtdM(rtdM),.ALUOutM(ALUOutM),.DMdInM(DMdInM),
                    .MtoRFSelM(MtoRFSelM),.DMWEM(DMWEM),
                    .BranchM(BranchM),.RFWEM(RFWEM),.JumpM(JumpM));
                    
ALU          DUT6(.ALUIn1(ALUIn1E),.ALUIn2(ALUIn2),.ALUSel(ALUSelE),.shamt(shamt),.ALUOut(ALUOut),.Zero(Zero));

Data_Mem     DUT7(.CLK(CLK),.DMWE(DMWEM),.DMA(ALUOutM),.DMWD(DMdInM),.DMRD(DMOut));

WRITEBACK    DUT21 (.CLK(CLK),.ALUOutM(ALUOutM),.DMOut(DMOut),.rtdM(rtdM),.RFWEM(RFWEM),
                    .MtoRFSelM(MtoRFSelM),.JumpM(JumpM),
                                                    // OUTPUT //
                    .ALUOutW(ALUOutW),.DMOutW(DMOutW),.rtdW(rtdW),.RFWEW(RFWEW),
                    .MtoRFSelW(MtoRFSelW),.JumpW(JumpW));

ALUDM        DUT11(.MtoRFSel(MtoRFSelW),.ALUOut(ALUOutW),.DMOut(DMOutW),.ALUDMOut(ALUDMOut));

HAZARD DUT22 (.rsD(rs),.rtD(rt),.rsE(rsE),.rtE(rtE),.rtdE(rtd),.rtdM(rtdM),.rtdW(rtdW),.RFWEM(RFWEM),.RFWEW(RFWEW),.JumpD(Jump),
              .MtoRFSelE(MtoRFSelE),.MtoRFSelM(MtoRFSelM),.BranchD(Branch),.RFWEE(RFWEE),
                                    // OUTPUT //
              .Stall(EN),.Flush(Flush),.ForwardAE(ForwardAE),.ForwardBE(ForwardBE),.ForwardAD(ForwardAD),.ForwardBD(ForwardBD));
              
              

/// ASSIGNING CORRECT NAMES TO WIRES ///
assign RFRA1 = rs;
assign RFRA2 = rt;
assign RFWA = rtdW;
assign RFWD = ALUDMOut;
assign ALUIn1 = ALUIn1E; 
//assign RFRD1 = ALUIn1;
//assign RFRD2 = ALUMUX1;
//assign ALUMUX1 = DMdIn;
assign DMA = ALUOutM;
assign DMRD = DMOut;

//------------------------------------//

endmodule