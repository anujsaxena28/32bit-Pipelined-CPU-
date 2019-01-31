// DECODER (5 to 32 line)
module decoder(in,out);
// I/O port declarations
input [4:0] in;
output [31:0] out;
wire [4:0] nn;

not(nn[0], in[0]);
not(nn[1], in[1]);
not(nn[2], in[2]);
not(nn[3], in[3]);
not(nn[4], in[4]);


and(out[0], nn[4], nn[3], nn[2], nn[1], nn[0]);
and(out[1], nn[4], nn[3], nn[2], nn[1], in[0]);
and(out[2], nn[4], nn[3], nn[2], in[1], nn[0]);
and(out[3], nn[4], nn[3], nn[2], in[1], in[0]);
and(out[4], nn[4], nn[3], in[2], nn[1], nn[0]);
and(out[5], nn[4], nn[3], in[2], nn[1], in[0]);
and(out[6], nn[4], nn[3], in[2], in[1], nn[0]);
and(out[7], nn[4], nn[3], in[2], in[1], in[0]);
and(out[8], nn[4], in[3], nn[2], nn[1], nn[0]);
and(out[9], nn[4], in[3], nn[2], nn[1], in[0]);
and(out[10], nn[4], in[3], nn[2], in[1], nn[0]);
and(out[11], nn[4], in[3], nn[2], in[1], in[0]);
and(out[12], nn[4], in[3], in[2], nn[1], nn[0]);
and(out[13], nn[4], in[3], in[2], nn[1], in[0]);
and(out[14], nn[4], in[3], in[2], in[1], nn[0]);
and(out[15], nn[4], in[3], in[2], in[1], in[0]);
and(out[16], in[4], nn[3], nn[2], nn[1], nn[0]);
and(out[17], in[4], nn[3], nn[2], nn[1], in[0]);
and(out[18], in[4], nn[3], nn[2], in[1], nn[0]);
and(out[19], in[4], nn[3], nn[2], in[1], in[0]);
and(out[20], in[4], nn[3], in[2], nn[1], nn[0]);
and(out[21], in[4], nn[3], in[2], nn[1], in[0]);
and(out[22], in[4], nn[3], in[2], in[1], nn[0]);
and(out[23], in[4], nn[3], in[2], in[1], in[0]);
and(out[24], in[4], in[3], nn[2], nn[1], nn[0]);
and(out[25], in[4], in[3], nn[2], nn[1], in[0]);
and(out[26], in[4], in[3], nn[2], in[1], nn[0]);
and(out[27], in[4], in[3], nn[2], in[1], in[0]);
and(out[28], in[4], in[3], in[2], nn[1], nn[0]);
and(out[29], in[4], in[3], in[2], nn[1], in[0]);
and(out[30], in[4], in[3], in[2], in[1], nn[0]);
and(out[31], in[4], in[3], in[2], in[1], in[0]);

endmodule


// TRISTATE BUFFER
module tristate(in, select, out);
// I/O declarations
	input in, select;
	output out;
	tri out;
//Tristate buffer logic
	bufif1 b1(out,in, select);
endmodule

// 32-BIT TRISTATE BUFFER
module tristate_32(in, select, out);
// I/O declarations
	input [31:0] in;
	input select;
	output [31:0] out;

	wire select_w;
	assign select_w = select;

//Calling 1 bit tristate buffer module for each bit of byte
	tristate t0(in[0],select_w,out[0]);
	tristate t1(in[1],select_w,out[1]);
	tristate t2(in[2],select_w,out[2]);
	tristate t3(in[3],select_w,out[3]);
	tristate t4(in[4],select_w,out[4]);
	tristate t5(in[5],select_w,out[5]);
	tristate t6(in[6],select_w,out[6]);
	tristate t7(in[7],select_w,out[7]);
	tristate t8(in[8],select_w,out[8]);
	tristate t9(in[9],select_w,out[9]);
	tristate t10(in[10],select_w,out[10]);
	tristate t11(in[11],select_w,out[11]);
	tristate t12(in[12],select_w,out[12]);
	tristate t13(in[13],select_w,out[13]);
	tristate t14(in[14],select_w,out[14]);
	tristate t15(in[15],select_w,out[15]);
	tristate t16(in[16],select_w,out[16]);
	tristate t17(in[17],select_w,out[17]);
	tristate t18(in[18],select_w,out[18]);
	tristate t19(in[19],select_w,out[19]);
	tristate t20(in[20],select_w,out[20]);
	tristate t21(in[21],select_w,out[21]);
	tristate t22(in[22],select_w,out[22]);
	tristate t23(in[23],select_w,out[23]);
	tristate t24(in[24],select_w,out[24]);
	tristate t25(in[25],select_w,out[25]);
	tristate t26(in[26],select_w,out[26]);
	tristate t27(in[27],select_w,out[27]);
	tristate t28(in[28],select_w,out[28]);
	tristate t29(in[29],select_w,out[29]);
	tristate t30(in[30],select_w,out[30]);
	tristate t31(in[31],select_w,out[31]);
endmodule


//1-bit D-register
module dreg(d, clk, qout);
// I/O port declarations
	input d, clk;
	output qout;

	reg qout;

	always @(posedge clk)
	qout <= d;
endmodule

//2-bit D-register
module dreg_2bit(d, clk, qout);
input [1:0] d;
input clk;
output [1:0] qout;

dreg m0(d[0], clk, qout[0]);
dreg m1(d[1], clk, qout[1]);

endmodule

//3-bit D-register
module dreg_3bit(d, clk, qout);
input [2:0] d;
input clk;
output [2:0] qout;

dreg m0(d[0], clk, qout[0]);
dreg m1(d[1], clk, qout[1]);
dreg m2(d[2], clk, qout[2]);
endmodule

// 5-bit D-register
module dreg_5bit(d, clk, qout);
// I/O port declarations
	input [4:0] d;
	input clk;
	output [4:0] qout;
// Calling 1 bit D-register for each bit of byte
	dreg me0(d[0], clk, qout[0]);
	dreg me1(d[1], clk, qout[1]);
	dreg me2(d[2], clk, qout[2]);
	dreg me3(d[3], clk, qout[3]);
	dreg me4(d[4], clk, qout[4]);
endmodule

//32-bit D-register
module dreg_32bit(d, clk, qout);
// I/O port declarations
	input [31:0]d;
	input clk;	
	output [31:0]qout;
//Calling 1 bit D-register for each bit of byte
	dreg me0(d[0], clk, qout[0]);
	dreg me1(d[1], clk, qout[1]);
	dreg me2(d[2], clk, qout[2]);
	dreg me3(d[3], clk, qout[3]);
	dreg me4(d[4], clk, qout[4]);
	dreg me5(d[5], clk, qout[5]);
	dreg me6(d[6], clk, qout[6]);
	dreg me7(d[7], clk, qout[7]);
        dreg me8(d[8], clk, qout[8]);
	dreg me9(d[9], clk, qout[9]);
	dreg me10(d[10], clk, qout[10]);
	dreg me11(d[11], clk, qout[11]);
	dreg me12(d[12], clk, qout[12]);
	dreg me13(d[13], clk, qout[13]);
	dreg me14(d[14], clk, qout[14]);
	dreg me15(d[15], clk, qout[15]);
        dreg me16(d[16], clk, qout[16]);
	dreg me17(d[17], clk, qout[17]);
	dreg me18(d[18], clk, qout[18]);
	dreg me19(d[19], clk, qout[19]);
	dreg me20(d[20], clk, qout[20]);
	dreg me21(d[21], clk, qout[21]);
	dreg me22(d[22], clk, qout[22]);
	dreg me23(d[23], clk, qout[23]);
        dreg me24(d[24], clk, qout[24]);
	dreg me25(d[25], clk, qout[25]);
	dreg me26(d[26], clk, qout[26]);
	dreg me27(d[27], clk, qout[27]);
	dreg me28(d[28], clk, qout[28]);
	dreg me29(d[29], clk, qout[29]);
	dreg me30(d[30], clk, qout[30]);
	dreg me31(d[31], clk, qout[31]);

endmodule




// 1-BIT 2-to-1 MUX
module mux2to1(in0,in1,outsel,out);
// I/O port declarations
	input in0,in1,outsel;
	output out;

	assign out=outsel ? in1:in0; 

endmodule

// 32-BIT 2-to-1 MUX
module mux2to1_32(in0,in1,outsel,out);
// I/O port declarations
	input [31:0] in0, in1;
	input outsel;
	output [31:0] out;

	wire outsel_w;
	assign outsel_w=outsel;

//Calling 2to1 bit MUX for 8 bit 2to1 MUX module
	mux2to1 m0(in0[0],in1[0],outsel_w,out[0]);
	mux2to1 m1(in0[1],in1[1],outsel_w,out[1]);
	mux2to1 m2(in0[2],in1[2],outsel_w,out[2]);
	mux2to1 m3(in0[3],in1[3],outsel_w,out[3]);
	mux2to1 m4(in0[4],in1[4],outsel_w,out[4]);
	mux2to1 m5(in0[5],in1[5],outsel_w,out[5]);
	mux2to1 m6(in0[6],in1[6],outsel_w,out[6]);
	mux2to1 m7(in0[7],in1[7],outsel_w,out[7]);
	mux2to1 m8(in0[8],in1[8],outsel_w,out[8]);
	mux2to1 m9(in0[9],in1[9],outsel_w,out[9]);
	mux2to1 m10(in0[10],in1[10],outsel_w,out[10]);
	mux2to1 m11(in0[11],in1[11],outsel_w,out[11]);
	mux2to1 m12(in0[12],in1[12],outsel_w,out[12]);
	mux2to1 m13(in0[13],in1[13],outsel_w,out[13]);
	mux2to1 m14(in0[14],in1[14],outsel_w,out[14]);
	mux2to1 m15(in0[15],in1[15],outsel_w,out[15]);
	mux2to1 m16(in0[16],in1[16],outsel_w,out[16]);
	mux2to1 m17(in0[17],in1[17],outsel_w,out[17]);
	mux2to1 m18(in0[18],in1[18],outsel_w,out[18]);
	mux2to1 m19(in0[19],in1[19],outsel_w,out[19]);
	mux2to1 m20(in0[20],in1[20],outsel_w,out[20]);
	mux2to1 m21(in0[21],in1[21],outsel_w,out[21]);
	mux2to1 m22(in0[22],in1[22],outsel_w,out[22]);
	mux2to1 m23(in0[23],in1[23],outsel_w,out[23]);
	mux2to1 m24(in0[24],in1[24],outsel_w,out[24]);
	mux2to1 m25(in0[25],in1[25],outsel_w,out[25]);
	mux2to1 m26(in0[26],in1[26],outsel_w,out[26]);
	mux2to1 m27(in0[27],in1[27],outsel_w,out[27]);
	mux2to1 m28(in0[28],in1[28],outsel_w,out[28]);
	mux2to1 m29(in0[29],in1[29],outsel_w,out[29]);
	mux2to1 m30(in0[30],in1[30],outsel_w,out[30]);
	mux2to1 m31(in0[31],in1[31],outsel_w,out[31]);
endmodule

// 32-BIT MEMORY
module memory_32bit(sel_a, sel_b, sel_b_p, clk, alu_out, out_a, out_b);
// I/O port declarations
	input clk, sel_a, sel_b, sel_b_p;
	input [31:0] alu_out;
	output [31:0] out_a, out_b;

	wire [31:0] out,mux_out;

//Calling 8 bit 2to1 MUX module
	mux2to1_32 m0(out, alu_out, sel_b_p, mux_out); 
//Calling 8 bit D-register
	dreg_32bit ll(mux_out, clk, out); 
//Calling 8 bit tristate buffer module
	tristate_32 t_a(out, sel_a, out_a);
	tristate_32 t_b(out, sel_b, out_b);

endmodule

//32x32 MEMORY

module memory_file(in_a, in_b, in_bb,clk, alu_out, out_a, out_b);

// I/O port declarations
	input [4:0] in_a, in_b, in_bb;
	input clk;
	input [31:0] alu_out;

	output [31:0] out_a, out_b;

	wire [31:0] sel_a, sel_b, sel_b_p;

//Decoding address line
decoder da(in_a, sel_a);
decoder db(in_b, sel_b);
decoder dc(in_bb, sel_b_p);

//Calling 8 bit memory storage 32 times to make 32 X 8 memory file.
	memory_32bit mer0(sel_a[0], sel_b[0], sel_b_p[0], clk, alu_out, out_a, out_b);
	memory_32bit mer1(sel_a[1], sel_b[1], sel_b_p[1], clk, alu_out, out_a, out_b);
	memory_32bit mer2(sel_a[2], sel_b[2], sel_b_p[2], clk, alu_out, out_a, out_b);
	memory_32bit mer3(sel_a[3], sel_b[3], sel_b_p[3], clk, alu_out, out_a, out_b);
	memory_32bit mer4(sel_a[4], sel_b[4], sel_b_p[4], clk, alu_out, out_a, out_b);
	memory_32bit mer5(sel_a[5], sel_b[5], sel_b_p[5], clk, alu_out, out_a, out_b);
	memory_32bit mer6(sel_a[6], sel_b[6], sel_b_p[6], clk, alu_out, out_a, out_b);
	memory_32bit mer7(sel_a[7], sel_b[7], sel_b_p[7], clk, alu_out, out_a, out_b);
	memory_32bit mer8(sel_a[8], sel_b[8], sel_b_p[8], clk, alu_out, out_a, out_b);
	memory_32bit mer9(sel_a[9], sel_b[9], sel_b_p[9], clk, alu_out, out_a, out_b);
	memory_32bit mer10(sel_a[10], sel_b[10], sel_b_p[10], clk, alu_out, out_a, out_b);
	memory_32bit mer11(sel_a[11], sel_b[11], sel_b_p[11], clk, alu_out, out_a, out_b);
	memory_32bit mer12(sel_a[12], sel_b[12], sel_b_p[12], clk, alu_out, out_a, out_b);
	memory_32bit mer13(sel_a[13], sel_b[13], sel_b_p[13], clk, alu_out, out_a, out_b);
	memory_32bit mer14(sel_a[14], sel_b[14], sel_b_p[14], clk, alu_out, out_a, out_b);
	memory_32bit mer15(sel_a[15], sel_b[15], sel_b_p[15], clk, alu_out, out_a, out_b);
	memory_32bit mer16(sel_a[16], sel_b[16], sel_b_p[16], clk, alu_out, out_a, out_b);
	memory_32bit mer17(sel_a[17], sel_b[17], sel_b_p[17], clk, alu_out, out_a, out_b);
	memory_32bit mer18(sel_a[18], sel_b[18], sel_b_p[18], clk, alu_out, out_a, out_b);
	memory_32bit mer19(sel_a[19], sel_b[19], sel_b_p[19], clk, alu_out, out_a, out_b);
	memory_32bit mer20(sel_a[20], sel_b[20], sel_b_p[20], clk, alu_out, out_a, out_b);
	memory_32bit mer21(sel_a[21], sel_b[21], sel_b_p[21], clk, alu_out, out_a, out_b);
	memory_32bit mer22(sel_a[22], sel_b[22], sel_b_p[22], clk, alu_out, out_a, out_b);
	memory_32bit mer23(sel_a[23], sel_b[23], sel_b_p[23], clk, alu_out, out_a, out_b);
	memory_32bit mer24(sel_a[24], sel_b[24], sel_b_p[24], clk, alu_out, out_a, out_b);
	memory_32bit mer25(sel_a[25], sel_b[25], sel_b_p[25], clk, alu_out, out_a, out_b);
	memory_32bit mer26(sel_a[26], sel_b[26], sel_b_p[26], clk, alu_out, out_a, out_b);
	memory_32bit mer27(sel_a[27], sel_b[27], sel_b_p[27], clk, alu_out, out_a, out_b);
	memory_32bit mer28(sel_a[28], sel_b[28], sel_b_p[28], clk, alu_out, out_a, out_b);
	memory_32bit mer29(sel_a[29], sel_b[29], sel_b_p[29], clk, alu_out, out_a, out_b);
	memory_32bit mer30(sel_a[30], sel_b[30], sel_b_p[30], clk, alu_out, out_a, out_b);
	memory_32bit mer31(sel_a[31], sel_b[31], sel_b_p[31], clk, alu_out, out_a, out_b);
	
endmodule


//memory block
module memoryBlock(addrA, addrB, Bback,Out, dataIn, asel, bsel,clk,outA, outB);

input [4:0] addrA, addrB, Bback;
input [31:0] dataIn,Out;
input asel, bsel,clk;
output [31:0] outA,outB;

wire [31:0] logic0=32'd0;
wire [31:0] out_a, out_b;

memory_file ram(addrA, addrB, Bback, clk, Out, out_a, out_b);


mux2to1_32 muxAa(dataIn, out_a, asel, outA);
mux2to1_32 muxA(logic0, out_b, bsel, outB);

endmodule


// Logic AND
module and_32bit(out,in1,in2);
//Output variables
	output [31:0] out;
//Input variables
	input [31:0] in1,in2;
//AND logic for 8 bit
	and a1[31:0](out,in1,in2);
endmodule


//Logic OR
module or_32bit(out,in1,in2);
//Output variables
	output [31:0] out;
//Input variables
	input [31:0] in1,in2;
//OR logic for 8 bit
	or (out[0],in1[0],in2[0]);
	or (out[1],in1[1],in2[1]);
	or (out[2],in1[2],in2[2]);
	or (out[3],in1[3],in2[3]);
	or (out[4],in1[4],in2[4]);
	or (out[5],in1[5],in2[5]);
	or (out[6],in1[6],in2[6]);
	or (out[7],in1[7],in2[7]);
	or (out[8],in1[8],in2[8]);
	or (out[9],in1[9],in2[9]);
	or (out[10],in1[10],in2[10]);
	or (out[11],in1[11],in2[11]);
	or (out[12],in1[12],in2[12]);
	or (out[13],in1[13],in2[13]);
	or (out[14],in1[14],in2[14]);
	or (out[15],in1[15],in2[15]);
	or (out[16],in1[16],in2[16]);
	or (out[17],in1[17],in2[17]);
	or (out[18],in1[18],in2[18]);
	or (out[19],in1[19],in2[19]);
	or (out[20],in1[20],in2[20]);
	or (out[21],in1[21],in2[21]);
	or (out[22],in1[22],in2[22]);
	or (out[23],in1[23],in2[23]);
	or (out[24],in1[24],in2[24]);
	or (out[25],in1[25],in2[25]);
	or (out[26],in1[26],in2[26]);
	or (out[27],in1[27],in2[27]);
	or (out[28],in1[28],in2[28]);
	or (out[29],in1[29],in2[29]);
	or (out[30],in1[30],in2[30]);
	or (out[31],in1[31],in2[31]);
endmodule



//Logic XOR
module xor_32bit(out,in1,in2);
//Output variables
	output [31:0] out;
//Input variables
	input [31:0] in1,in2;
//XOR logic for 8 bit
	xor (out[0],in1[0],in2[0]);
	xor (out[1],in1[1],in2[1]);
	xor (out[2],in1[2],in2[2]);
	xor (out[3],in1[3],in2[3]);
	xor (out[4],in1[4],in2[4]);
	xor (out[5],in1[5],in2[5]);
	xor (out[6],in1[6],in2[6]);
	xor (out[7],in1[7],in2[7]);
	xor (out[8],in1[8],in2[8]);
	xor (out[9],in1[9],in2[9]);
	xor (out[10],in1[10],in2[10]);
	xor (out[11],in1[11],in2[11]);
	xor (out[12],in1[12],in2[12]);
	xor (out[13],in1[13],in2[13]);
	xor (out[14],in1[14],in2[14]);
	xor (out[15],in1[15],in2[15]);
	xor (out[16],in1[16],in2[16]);
	xor (out[17],in1[17],in2[17]);
	xor (out[18],in1[18],in2[18]);
	xor (out[19],in1[19],in2[19]);
	xor (out[20],in1[20],in2[20]);
	xor (out[21],in1[21],in2[21]);
	xor (out[22],in1[22],in2[22]);
	xor (out[23],in1[23],in2[23]);
	xor (out[24],in1[24],in2[24]);
	xor (out[25],in1[25],in2[25]);
	xor (out[26],in1[26],in2[26]);
	xor (out[27],in1[27],in2[27]);
	xor (out[28],in1[28],in2[28]);
	xor (out[29],in1[29],in2[29]);
	xor (out[30],in1[30],in2[30]);
	xor (out[31],in1[31],in2[31]);
endmodule



//Logic XNOR
module xnor_32bit(out,in1,in2);
//Output variables
	output [31:0] out;
//Input variables
	input [31:0] in1,in2;
// XNOR logic for 8 bit
	xnor (out[0],in1[0],in2[0]);
	xnor (out[1],in1[1],in2[1]);
	xnor (out[2],in1[2],in2[2]);
	xnor (out[3],in1[3],in2[3]);
	xnor (out[4],in1[4],in2[4]);
	xnor (out[5],in1[5],in2[5]);
	xnor (out[6],in1[6],in2[6]);
	xnor (out[7],in1[7],in2[7]);
	xnor (out[8],in1[8],in2[8]);
	xnor (out[9],in1[9],in2[9]);
	xnor (out[10],in1[10],in2[10]);
	xnor (out[11],in1[11],in2[11]);
	xnor (out[12],in1[12],in2[12]);
	xnor (out[13],in1[13],in2[13]);
	xnor (out[14],in1[14],in2[14]);
	xnor (out[15],in1[15],in2[15]);
	xnor (out[16],in1[16],in2[16]);
	xnor (out[17],in1[17],in2[17]);
	xnor (out[18],in1[18],in2[18]);
	xnor (out[19],in1[19],in2[19]);
	xnor (out[20],in1[20],in2[20]);
	xnor (out[21],in1[21],in2[21]);
	xnor (out[22],in1[22],in2[22]);
	xnor (out[23],in1[23],in2[23]);
	xnor (out[24],in1[24],in2[24]);
	xnor (out[25],in1[25],in2[25]);
	xnor (out[26],in1[26],in2[26]);
	xnor (out[27],in1[27],in2[27]);
	xnor (out[28],in1[28],in2[28]);
	xnor (out[29],in1[29],in2[29]);
	xnor (out[30],in1[30],in2[30]);
	xnor (out[31],in1[31],in2[31]);
endmodule


//LOGIC FUNCTION BLOCK
	module logic_fn(OUT_FN,A,B,SEL);
//Output variables
	output [31:0] OUT_FN;
//Input variables
	input [31:0] A,B;
	input [1:0] SEL;
//Wire
	wire [31:0] OUT_XOR, OUT_XNOR, OUT_OR, OUT_AND;
	reg [31:0] OUT_FN;
//Calling XOR, XNOR, OR, AND 8 BIT LOGIC MODULES
	xor_32bit value(OUT_XOR,A,B);
	xnor_32bit value1(OUT_XNOR,A,B);
	or_32bit value2(OUT_OR,A,B);
	and_32bit value3(OUT_AND,A,B);
//CASE LOOP
	always @(OUT_AND or OUT_OR or OUT_XOR or OUT_XNOR or SEL[1] or SEL[0])
	case ({SEL[1],SEL[0]})
	2'b00 : OUT_FN = OUT_AND;
	2'b01 : OUT_FN = OUT_OR;
	2'b10 : OUT_FN = OUT_XOR;
	2'b11 : OUT_FN = OUT_XNOR;
	default : $display("Please check Select Lines!");
	endcase
endmodule

// 1 bit full adder
module fa(sum, c_out, a, b, c_in); 

// I/O port declarations
input a, b, c_in;
output sum, c_out;

// internal nets
wire s1, c1, c2;

// instant logic gate primitives
xor(s1, a, b);
and(c1, a, b);

xor(sum, s1, c_in);
and(c2, s1, c_in);

xor(c_out, c2, c1);

endmodule

// Addition and Subtraction in ALU

module as32b(sum, c_out, over, a, b, inv);

output [31:0] sum;

output c_out, over;

input [31:0] a, b;

input [1:0] inv;

//internal nets

wire [31:0] xa, xb;

wire xiab;

//integer i;

xor x1 [31:0] (xa, a, {32{inv[1]}});

xor x2 [31:0] (xb, b, {32{inv[0]}});

xor x_3 (xiab, inv[1], inv[0]);

cla32 cla_32(.s(sum), .c32(c_out), .over(over), .a(xa), .b(xb), .c0(xiab));
endmodule

//1-bit PG logic for Adder 
module pfa(s, a, b, c, p, g);
    output s, p, g;
    input a, b, c;
    
    assign s = a ^ b ^ c;
    assign p = a ^ b;//propagate of 1-bit pfa
    assign g = a & b;//generate of 1-bit pfa
      
endmodule

//carry generator module of 1-bit pfa
module carry(cout, p_in, g_in, cin);
    output cout; 
    input p_in, g_in;
    input cin;
    
    assign cout = (cin & p_in) | g_in;

endmodule

//4-bit carry lookahead
module carrylookahead_4(s, c4, g_4, p_4, over, a, b, c0);
    output [3:0] s;
    output g_4, p_4; //g0_3, p0_3
    output c4, over;
    
    input [3:0] a, b;
    input c0;
    
    wire c1, c2, c3;
    wire [3:0] p, g;
    
    pfa pfa0(.s(s[0]), .a(a[0]), .b(b[0]), .c(c0), .p(p[0]), .g(g[0]));
    pfa pfa1(.s(s[1]), .a(a[1]), .b(b[1]), .c(c1), .p(p[1]), .g(g[1]));
    pfa pfa2(.s(s[2]), .a(a[2]), .b(b[2]), .c(c2), .p(p[2]), .g(g[2]));
    pfa pfa3(.s(s[3]), .a(a[3]), .b(b[3]), .c(c3), .p(p[3]), .g(g[3]));
    
    carry cr1(.p_in(p[0]), .g_in(g[0]), .cin(c0), .cout(c1));
    carry cr2(.p_in(p[1]), .g_in(g[1]), .cin(c1), .cout(c2));
    carry cr3(.p_in(p[2]), .g_in(g[2]), .cin(c2), .cout(c3));
    carry cr4(.p_in(p[3]), .g_in(g[3]), .cin(c3), .cout(c4));
    
    assign p_4 = p[3] & p[2] & p[1] & p[0];
    assign g_4 = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);
    assign over = c3^c4;
    
endmodule

//16-bit carry lookahead
module carrylookahead_16(s, c16, g_16, p_16, over, a, b, c0);
    output [15:0] s;
    output g_16, p_16;
    output c16, over;
    
    input [15:0] a, b;
    input c0;
    
    wire c4, c8, c12;
    //wire [3:0] s3_0, s7_4, s11_8, s15_12;
    wire [3:0] p, g;
    
    carrylookahead_4 CLA0(.s(s[3:0]), .a(a[3:0]), .b(b[3:0]), .c0(c0), .c4(c4), .g_4(g[0]), .p_4(p[0]));
    carrylookahead_4 CLA1(.s(s[7:4]), .a(a[7:4]), .b(b[7:4]), .c0(c4), .c4(c8), .g_4(g[1]), .p_4(p[1]));    
    carrylookahead_4 CLA2(.s(s[11:8]), .a(a[11:8]), .b(b[11:8]), .c0(c8), .c4(c12), .g_4(g[2]), .p_4(p[2]));   
    carrylookahead_4 CLA3(.s(s[15:12]), .a(a[15:12]), .b(b[15:12]), .c0(c12), .c4(c16), .g_4(g[3]), .p_4(p[3]), .over(over));
    
    assign p_16 = p[3] & p[2] & p[1] & p[0];
    assign g_16 = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]);

endmodule   

//32-bit carry lookahead
module cla32(s, c32, over, a, b, c0);
    output [31:0] s;
    output c32, over;
    
    input [31:0] a, b;
    input c0;
    
    wire c16;
    wire [1:0] p, g;
    
    carrylookahead_16 CLA0(.s(s[15:0]), .a(a[15:0]), .b(b[15:0]), .c0(c0), .c16(c16), .p_16(p[0]), .g_16(g[0]));
    carrylookahead_16 CLA1(.s(s[31:16]), .a(a[31:16]), .b(b[31:16]), .c0(c16), .c16(c32), .p_16(p[1]), .g_16(g[1]), .over(over)); 
    
endmodule

//1 bit half adder
module ha(sum, c_out, a, b);

input a,b;
output sum, c_out;
 
xor(sum, a, b);
and(c_out, a, b);

endmodule


//multiplier
module mul(msb, lsb , a, b, clk);

input [31:0] a,b;
input clk;
output [31:0] msb, lsb;

wire [31:0] p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31;
wire [31:0] c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30, c31;
wire [31:0] ps0, ps1, ps2, ps3, ps4, ps5, ps6, ps7, ps8, ps9, ps10, ps11, ps12, ps13, ps14, ps15, ps16, ps17, ps18, ps19, ps20, ps21, ps22, ps23,ps24, ps25, ps26, ps27, ps28, ps29, ps30, ps31;
wire [31:0] to_reg;
wire c030, c129, c228, c327, c426, c525, c624, c723, c822, c921, c1020, c1119, c1218, c1317, c1416, c1515, c1614, c1713, c1812, c1911, c2010, c219, c2028, c237, c246, c255, c264, c273, c282, c291, c300;
wire [31:0] pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15, pp16, pp17, pp18, pp19, pp20, pp21, pp22, pp23, pp24, pp25, pp26, pp27, pp28, pp29, pp30, pp31 ;

and m0 [31:0] (p0, b,{32{a [0]}});
and m1 [31:0] (p1, b,{32{a [1]}});
and m2 [31:0] (p2, b,{32{a [2]}});
and m3 [31:0] (p3, b,{32{a [3]}});
and m4 [31:0] (p4, b,{32{a [4]}});
and m5 [31:0] (p5, b,{32{a [5]}});
and m6 [31:0] (p6, b,{32{a [6]}});
and m7 [31:0] (p7, b,{32{a [7]}});
and m8 [31:0] (p8, b,{32{a [8]}});
and m9 [31:0] (p9, b,{32{a [9]}});
and m10 [31:0] (p10, b,{32{a [10]}});
and m11 [31:0] (p11, b,{32{a [11]}});
and m12 [31:0] (p12, b,{32{a [12]}});
and m13 [31:0] (p13, b,{32{a [13]}});
and m14 [31:0] (p14, b,{32{a [14]}});
and m15 [31:0] (p15, b,{32{a [15]}});
and m16 [31:0] (p16, b,{32{a [16]}});
and m17 [31:0] (p17, b,{32{a [17]}});
and m18 [31:0] (p18, b,{32{a [18]}});
and m19 [31:0] (p19, b,{32{a [19]}});
and m20 [31:0] (p20, b,{32{a [20]}});
and m21 [31:0] (p21, b,{32{a [21]}});
and m22 [31:0] (p22, b,{32{a [22]}});
and m23 [31:0] (p23, b,{32{a [23]}});
and m24 [31:0] (p24, b,{32{a [24]}});
and m25 [31:0] (p25, b,{32{a [25]}});
and m26 [31:0] (p26, b,{32{a [26]}});
and m27 [31:0] (p27, b,{32{a [27]}});
and m28 [31:0] (p28, b,{32{a [28]}});
and m29 [31:0] (p29, b,{32{a [29]}});
and m30 [31:0] (p30, b,{32{a [30]}});
and m31 [31:0] (p31, b,{32{a [31]}});


ha h01(ps0[0], c0[0], p0[1], p1[0]);
fa f02(ps0[1], c0[1], p0[2], p1[1], c0[0]);
fa f03(ps0[2], c0[2], p0[3], p1[2], c0[1]);
fa f04(ps0[3], c0[3], p0[4], p1[3], c0[2]);
fa f05(ps0[4], c0[4], p0[5], p1[4], c0[3]);
fa f06(ps0[5], c0[5], p0[6], p1[5], c0[4]);
fa f07(ps0[6], c0[6], p0[7], p1[6], c0[5]);
fa f08(ps0[7], c0[7], p0[8], p1[7], c0[6]);
fa f09(ps0[8], c0[8], p0[9], p1[8], c0[7]);
fa f010(ps0[9], c0[9], p0[10], p1[9], c0[8]);
fa f011(ps0[10], c0[10], p0[11], p1[10], c0[9]);
fa f012(ps0[11], c0[11], p0[12], p1[11], c0[10]);
fa f013(ps0[12], c0[12], p0[13], p1[12], c0[11]);
fa f014(ps0[13], c0[13], p0[14], p1[13], c0[12]);
fa f015(ps0[14], c0[14], p0[15], p1[14], c0[13]);
fa f016(ps0[15], c0[15], p0[16], p1[15], c0[14]);
fa f017(ps0[16], c0[16], p0[17], p1[16], c0[15]);
fa f018(ps0[17], c0[17], p0[18], p1[17], c0[16]);
fa f019(ps0[18], c0[18], p0[19], p1[18], c0[17]);
fa f020(ps0[19], c0[19], p0[20], p1[19], c0[18]);
fa f021(ps0[20], c0[20], p0[21], p1[20], c0[19]);
fa f022(ps0[21], c0[21], p0[22], p1[21], c0[20]);
fa f023(ps0[22], c0[22], p0[23], p1[22], c0[21]);
fa f024(ps0[23], c0[23], p0[24], p1[23], c0[22]);
fa f025(ps0[24], c0[24], p0[25], p1[24], c0[23]);
fa f026(ps0[25], c0[25], p0[26], p1[25], c0[24]);
fa f027(ps0[26], c0[26], p0[27], p1[26], c0[25]);
fa f028(ps0[27], c0[27], p0[28], p1[27], c0[26]);
fa f029(ps0[28], c0[28], p0[29], p1[28], c0[27]);
fa f030(ps0[29], c0[29], p0[30], p1[29], c0[28]);
fa f031(ps0[30], c0[30], p0[31], p1[30], c0[29]);

ha h11(ps1[0], c1[0], ps0[1], p2[0]);
fa f12(ps1[1], c1[1], ps0[2], p2[1], c1[0]);
fa f13(ps1[2], c1[2], ps0[3], p2[2], c1[1]);
fa f14(ps1[3], c1[3], ps0[4], p2[3], c1[2]);
fa f15(ps1[4], c1[4], ps0[5], p2[4], c1[3]);
fa f16(ps1[5], c1[5], ps0[6], p2[5], c1[4]);
fa f17(ps1[6], c1[6], ps0[7], p2[6], c1[5]);
fa f18(ps1[7], c1[7], ps0[8], p2[7], c1[6]);
fa f19(ps1[8], c1[8], ps0[9], p2[8], c1[7]);
fa f110(ps1[9], c1[9], ps0[10], p2[9], c1[8]);
fa f111(ps1[10], c1[10], ps0[11], p2[10], c1[9]);
fa f112(ps1[11], c1[11], ps0[12], p2[11], c1[10]);
fa f113(ps1[12], c1[12], ps0[13], p2[12], c1[11]);
fa f114(ps1[13], c1[13], ps0[14], p2[13], c1[12]);
fa f115(ps1[14], c1[14], ps0[15], p2[14], c1[13]);
fa f116(ps1[15], c1[15], ps0[16], p2[15], c1[14]);
fa f117(ps1[16], c1[16], ps0[17], p2[16], c1[15]);
fa f118(ps1[17], c1[17], ps0[18], p2[17], c1[16]);
fa f119(ps1[18], c1[18], ps0[19], p2[18], c1[17]);
fa f120(ps1[19], c1[19], ps0[20], p2[19], c1[18]);
fa f121(ps1[20], c1[20], ps0[21], p2[20], c1[19]);
fa f122(ps1[21], c1[21], ps0[22], p2[21], c1[20]);
fa f123(ps1[22], c1[22], ps0[23], p2[22], c1[21]);
fa f124(ps1[23], c1[23], ps0[24], p2[23], c1[22]);
fa f125(ps1[24], c1[24], ps0[25], p2[24], c1[23]);
fa f126(ps1[25], c1[25], ps0[26], p2[25], c1[24]);
fa f127(ps1[26], c1[26], ps0[27], p2[26], c1[25]);
fa f128(ps1[27], c1[27], ps0[28], p2[27], c1[26]);
fa f129(ps1[28], c1[28], ps0[29], p2[28], c1[27]);
fa f130(ps1[29], c1[29], ps0[30], p2[29], c1[28]);

ha h21(ps2[0], c2[0], ps1[1], p3[0]);
fa f22(ps2[1], c2[1], ps1[2], p3[1], c2[0]);
fa f23(ps2[2], c2[2], ps1[3], p3[2], c2[1]);
fa f24(ps2[3], c2[3], ps1[4], p3[3], c2[2]);
fa f25(ps2[4], c2[4], ps1[5], p3[4], c2[3]);
fa f26(ps2[5], c2[5], ps1[6], p3[5], c2[4]);
fa f27(ps2[6], c2[6], ps1[7], p3[6], c2[5]);
fa f28(ps2[7], c2[7], ps1[8], p3[7], c2[6]);
fa f29(ps2[8], c2[8], ps1[9], p3[8], c2[7]);
fa f210(ps2[9], c2[9], ps1[10], p3[9], c2[8]);
fa f211(ps2[10], c2[10], ps1[11], p3[10], c2[9]);
fa f212(ps2[11], c2[11], ps1[12], p3[11], c2[10]);
fa f213(ps2[12], c2[12], ps1[13], p3[12], c2[11]);
fa f214(ps2[13], c2[13], ps1[14], p3[13], c2[12]);
fa f215(ps2[14], c2[14], ps1[15], p3[14], c2[13]);
fa f216(ps2[15], c2[15], ps1[16], p3[15], c2[14]);
fa f217(ps2[16], c2[16], ps1[17], p3[16], c2[15]);
fa f218(ps2[17], c2[17], ps1[18], p3[17], c2[16]);
fa f219(ps2[18], c2[18], ps1[19], p3[18], c2[17]);
fa f220(ps2[19], c2[19], ps1[20], p3[19], c2[18]);
fa f221(ps2[20], c2[20], ps1[21], p3[20], c2[19]);
fa f222(ps2[21], c2[21], ps1[22], p3[21], c2[20]);
fa f223(ps2[22], c2[22], ps1[23], p3[22], c2[21]);
fa f224(ps2[23], c2[23], ps1[24], p3[23], c2[22]);
fa f225(ps2[24], c2[24], ps1[25], p3[24], c2[23]);
fa f226(ps2[25], c2[25], ps1[26], p3[25], c2[24]);
fa f227(ps2[26], c2[26], ps1[27], p3[26], c2[25]);
fa f228(ps2[27], c2[27], ps1[28], p3[27], c2[26]);
fa f229(ps2[28], c2[28], ps1[29], p3[28], c2[27]);

ha h31(ps3[0], c3[0], ps2[1], p4[0]);
fa f32(ps3[1], c3[1], ps2[2], p4[1], c3[0]);
fa f33(ps3[2], c3[2], ps2[3], p4[2], c3[1]);
fa f34(ps3[3], c3[3], ps2[4], p4[3], c3[2]);
fa f35(ps3[4], c3[4], ps2[5], p4[4], c3[3]);
fa f36(ps3[5], c3[5], ps2[6], p4[5], c3[4]);
fa f37(ps3[6], c3[6], ps2[7], p4[6], c3[5]);
fa f38(ps3[7], c3[7], ps2[8], p4[7], c3[6]);
fa f39(ps3[8], c3[8], ps2[9], p4[8], c3[7]);
fa f310(ps3[9], c3[9], ps2[10], p4[9], c3[8]);
fa f311(ps3[10], c3[10], ps2[11], p4[10], c3[9]);
fa f312(ps3[11], c3[11], ps2[12], p4[11], c3[10]);
fa f313(ps3[12], c3[12], ps2[13], p4[12], c3[11]);
fa f314(ps3[13], c3[13], ps2[14], p4[13], c3[12]);
fa f315(ps3[14], c3[14], ps2[15], p4[14], c3[13]);
fa f316(ps3[15], c3[15], ps2[16], p4[15], c3[14]);
fa f317(ps3[16], c3[16], ps2[17], p4[16], c3[15]);
fa f318(ps3[17], c3[17], ps2[18], p4[17], c3[16]);
fa f319(ps3[18], c3[18], ps2[19], p4[18], c3[17]);
fa f320(ps3[19], c3[19], ps2[20], p4[19], c3[18]);
fa f321(ps3[20], c3[20], ps2[21], p4[20], c3[19]);
fa f322(ps3[21], c3[21], ps2[22], p4[21], c3[20]);
fa f323(ps3[22], c3[22], ps2[23], p4[22], c3[21]);
fa f324(ps3[23], c3[23], ps2[24], p4[23], c3[22]);
fa f325(ps3[24], c3[24], ps2[25], p4[24], c3[23]);
fa f326(ps3[25], c3[25], ps2[26], p4[25], c3[24]);
fa f327(ps3[26], c3[26], ps2[27], p4[26], c3[25]);
fa f328(ps3[27], c3[27], ps2[28], p4[27], c3[26]);

ha h41(ps4[0], c4[0], ps3[1], p5[0]);
fa f42(ps4[1], c4[1], ps3[2], p5[1], c4[0]);
fa f43(ps4[2], c4[2], ps3[3], p5[2], c4[1]);
fa f44(ps4[3], c4[3], ps3[4], p5[3], c4[2]);
fa f45(ps4[4], c4[4], ps3[5], p5[4], c4[3]);
fa f46(ps4[5], c4[5], ps3[6], p5[5], c4[4]);
fa f47(ps4[6], c4[6], ps3[7], p5[6], c4[5]);
fa f48(ps4[7], c4[7], ps3[8], p5[7], c4[6]);
fa f49(ps4[8], c4[8], ps3[9], p5[8], c4[7]);
fa f410(ps4[9], c4[9], ps3[10], p5[9], c4[8]);
fa f411(ps4[10], c4[10], ps3[11], p5[10], c4[9]);
fa f412(ps4[11], c4[11], ps3[12], p5[11], c4[10]);
fa f413(ps4[12], c4[12], ps3[13], p5[12], c4[11]);
fa f414(ps4[13], c4[13], ps3[14], p5[13], c4[12]);
fa f415(ps4[14], c4[14], ps3[15], p5[14], c4[13]);
fa f416(ps4[15], c4[15], ps3[16], p5[15], c4[14]);
fa f417(ps4[16], c4[16], ps3[17], p5[16], c4[15]);
fa f418(ps4[17], c4[17], ps3[18], p5[17], c4[16]);
fa f419(ps4[18], c4[18], ps3[19], p5[18], c4[17]);
fa f420(ps4[19], c4[19], ps3[20], p5[19], c4[18]);
fa f421(ps4[20], c4[20], ps3[21], p5[20], c4[19]);
fa f422(ps4[21], c4[21], ps3[22], p5[21], c4[20]);
fa f423(ps4[22], c4[22], ps3[23], p5[22], c4[21]);
fa f424(ps4[23], c4[23], ps3[24], p5[23], c4[22]);
fa f425(ps4[24], c4[24], ps3[25], p5[24], c4[23]);
fa f426(ps4[25], c4[25], ps3[26], p5[25], c4[24]);
fa f427(ps4[26], c4[26], ps3[27], p5[26], c4[25]);

ha h51(ps5[0], c5[0], ps4[1], p6[0]);
fa f52(ps5[1], c5[1], ps4[2], p6[1], c5[0]);
fa f53(ps5[2], c5[2], ps4[3], p6[2], c5[1]);
fa f54(ps5[3], c5[3], ps4[4], p6[3], c5[2]);
fa f55(ps5[4], c5[4], ps4[5], p6[4], c5[3]);
fa f56(ps5[5], c5[5], ps4[6], p6[5], c5[4]);
fa f57(ps5[6], c5[6], ps4[7], p6[6], c5[5]);
fa f58(ps5[7], c5[7], ps4[8], p6[7], c5[6]);
fa f59(ps5[8], c5[8], ps4[9], p6[8], c5[7]);
fa f510(ps5[9], c5[9], ps4[10], p6[9], c5[8]);
fa f511(ps5[10], c5[10], ps4[11], p6[10], c5[9]);
fa f512(ps5[11], c5[11], ps4[12], p6[11], c5[10]);
fa f513(ps5[12], c5[12], ps4[13], p6[12], c5[11]);
fa f514(ps5[13], c5[13], ps4[14], p6[13], c5[12]);
fa f515(ps5[14], c5[14], ps4[15], p6[14], c5[13]);
fa f516(ps5[15], c5[15], ps4[16], p6[15], c5[14]);
fa f517(ps5[16], c5[16], ps4[17], p6[16], c5[15]);
fa f518(ps5[17], c5[17], ps4[18], p6[17], c5[16]);
fa f519(ps5[18], c5[18], ps4[19], p6[18], c5[17]);
fa f520(ps5[19], c5[19], ps4[20], p6[19], c5[18]);
fa f521(ps5[20], c5[20], ps4[21], p6[20], c5[19]);
fa f522(ps5[21], c5[21], ps4[22], p6[21], c5[20]);
fa f523(ps5[22], c5[22], ps4[23], p6[22], c5[21]);
fa f524(ps5[23], c5[23], ps4[24], p6[23], c5[22]);
fa f525(ps5[24], c5[24], ps4[25], p6[24], c5[23]);
fa f526(ps5[25], c5[25], ps4[26], p6[25], c5[24]);

ha h61(ps6[0], c6[0], ps5[1], p7[0]);
fa f62(ps6[1], c6[1], ps5[2], p7[1], c6[0]);
fa f63(ps6[2], c6[2], ps5[3], p7[2], c6[1]);
fa f64(ps6[3], c6[3], ps5[4], p7[3], c6[2]);
fa f65(ps6[4], c6[4], ps5[5], p7[4], c6[3]);
fa f66(ps6[5], c6[5], ps5[6], p7[5], c6[4]);
fa f67(ps6[6], c6[6], ps5[7], p7[6], c6[5]);
fa f68(ps6[7], c6[7], ps5[8], p7[7], c6[6]);
fa f69(ps6[8], c6[8], ps5[9], p7[8], c6[7]);
fa f610(ps6[9], c6[9], ps5[10], p7[9], c6[8]);
fa f611(ps6[10], c6[10], ps5[11], p7[10], c6[9]);
fa f612(ps6[11], c6[11], ps5[12], p7[11], c6[10]);
fa f613(ps6[12], c6[12], ps5[13], p7[12], c6[11]);
fa f614(ps6[13], c6[13], ps5[14], p7[13], c6[12]);
fa f615(ps6[14], c6[14], ps5[15], p7[14], c6[13]);
fa f616(ps6[15], c6[15], ps5[16], p7[15], c6[14]);
fa f617(ps6[16], c6[16], ps5[17], p7[16], c6[15]);
fa f618(ps6[17], c6[17], ps5[18], p7[17], c6[16]);
fa f619(ps6[18], c6[18], ps5[19], p7[18], c6[17]);
fa f620(ps6[19], c6[19], ps5[20], p7[19], c6[18]);
fa f621(ps6[20], c6[20], ps5[21], p7[20], c6[19]);
fa f622(ps6[21], c6[21], ps5[22], p7[21], c6[20]);
fa f623(ps6[22], c6[22], ps5[23], p7[22], c6[21]);
fa f624(ps6[23], c6[23], ps5[24], p7[23], c6[22]);
fa f625(ps6[24], c6[24], ps5[25], p7[24], c6[23]);

ha h71(ps7[0], c7[0], ps6[1], p8[0]);
fa f72(ps7[1], c7[1], ps6[2], p8[1], c7[0]);
fa f73(ps7[2], c7[2], ps6[3], p8[2], c7[1]);
fa f74(ps7[3], c7[3], ps6[4], p8[3], c7[2]);
fa f75(ps7[4], c7[4], ps6[5], p8[4], c7[3]);
fa f76(ps7[5], c7[5], ps6[6], p8[5], c7[4]);
fa f77(ps7[6], c7[6], ps6[7], p8[6], c7[5]);
fa f78(ps7[7], c7[7], ps6[8], p8[7], c7[6]);
fa f79(ps7[8], c7[8], ps6[9], p8[8], c7[7]);
fa f710(ps7[9], c7[9], ps6[10], p8[9], c7[8]);
fa f711(ps7[10], c7[10], ps6[11], p8[10], c7[9]);
fa f712(ps7[11], c7[11], ps6[12], p8[11], c7[10]);
fa f713(ps7[12], c7[12], ps6[13], p8[12], c7[11]);
fa f714(ps7[13], c7[13], ps6[14], p8[13], c7[12]);
fa f715(ps7[14], c7[14], ps6[15], p8[14], c7[13]);
fa f716(ps7[15], c7[15], ps6[16], p8[15], c7[14]);
fa f717(ps7[16], c7[16], ps6[17], p8[16], c7[15]);
fa f718(ps7[17], c7[17], ps6[18], p8[17], c7[16]);
fa f719(ps7[18], c7[18], ps6[19], p8[18], c7[17]);
fa f720(ps7[19], c7[19], ps6[20], p8[19], c7[18]);
fa f721(ps7[20], c7[20], ps6[21], p8[20], c7[19]);
fa f722(ps7[21], c7[21], ps6[22], p8[21], c7[20]);
fa f723(ps7[22], c7[22], ps6[23], p8[22], c7[21]);
fa f724(ps7[23], c7[23], ps6[24], p8[23], c7[22]);

ha h81(ps8[0], c8[0], ps7[1], p9[0]);
fa f82(ps8[1], c8[1], ps7[2], p9[1], c8[0]);
fa f83(ps8[2], c8[2], ps7[3], p9[2], c8[1]);
fa f84(ps8[3], c8[3], ps7[4], p9[3], c8[2]);
fa f85(ps8[4], c8[4], ps7[5], p9[4], c8[3]);
fa f86(ps8[5], c8[5], ps7[6], p9[5], c8[4]);
fa f87(ps8[6], c8[6], ps7[7], p9[6], c8[5]);
fa f88(ps8[7], c8[7], ps7[8], p9[7], c8[6]);
fa f89(ps8[8], c8[8], ps7[9], p9[8], c8[7]);
fa f810(ps8[9], c8[9], ps7[10], p9[9], c8[8]);
fa f811(ps8[10], c8[10], ps7[11], p9[10], c8[9]);
fa f812(ps8[11], c8[11], ps7[12], p9[11], c8[10]);
fa f813(ps8[12], c8[12], ps7[13], p9[12], c8[11]);
fa f814(ps8[13], c8[13], ps7[14], p9[13], c8[12]);
fa f815(ps8[14], c8[14], ps7[15], p9[14], c8[13]);
fa f816(ps8[15], c8[15], ps7[16], p9[15], c8[14]);
fa f817(ps8[16], c8[16], ps7[17], p9[16], c8[15]);
fa f818(ps8[17], c8[17], ps7[18], p9[17], c8[16]);
fa f819(ps8[18], c8[18], ps7[19], p9[18], c8[17]);
fa f820(ps8[19], c8[19], ps7[20], p9[19], c8[18]);
fa f821(ps8[20], c8[20], ps7[21], p9[20], c8[19]);
fa f822(ps8[21], c8[21], ps7[22], p9[21], c8[20]);
fa f823(ps8[22], c8[22], ps7[23], p9[22], c8[21]);

ha h91(ps9[0], c9[0], ps8[1], p10[0]);
fa f92(ps9[1], c9[1], ps8[2], p10[1], c9[0]);
fa f93(ps9[2], c9[2], ps8[3], p10[2], c9[1]);
fa f94(ps9[3], c9[3], ps8[4], p10[3], c9[2]);
fa f95(ps9[4], c9[4], ps8[5], p10[4], c9[3]);
fa f96(ps9[5], c9[5], ps8[6], p10[5], c9[4]);
fa f97(ps9[6], c9[6], ps8[7], p10[6], c9[5]);
fa f98(ps9[7], c9[7], ps8[8], p10[7], c9[6]);
fa f99(ps9[8], c9[8], ps8[9], p10[8], c9[7]);
fa f910(ps9[9], c9[9], ps8[10], p10[9], c9[8]);
fa f911(ps9[10], c9[10], ps8[11], p10[10], c9[9]);
fa f912(ps9[11], c9[11], ps8[12], p10[11], c9[10]);
fa f913(ps9[12], c9[12], ps8[13], p10[12], c9[11]);
fa f914(ps9[13], c9[13], ps8[14], p10[13], c9[12]);
fa f915(ps9[14], c9[14], ps8[15], p10[14], c9[13]);
fa f916(ps9[15], c9[15], ps8[16], p10[15], c9[14]);
fa f917(ps9[16], c9[16], ps8[17], p10[16], c9[15]);
fa f918(ps9[17], c9[17], ps8[18], p10[17], c9[16]);
fa f919(ps9[18], c9[18], ps8[19], p10[18], c9[17]);
fa f920(ps9[19], c9[19], ps8[20], p10[19], c9[18]);
fa f921(ps9[20], c9[20], ps8[21], p10[20], c9[19]);
fa f922(ps9[21], c9[21], ps8[22], p10[21], c9[20]);

ha h101(ps10[0], c10[0], ps9[1], p11[0]);
fa f102(ps10[1], c10[1], ps9[2], p11[1], c10[0]);
fa f103(ps10[2], c10[2], ps9[3], p11[2], c10[1]);
fa f104(ps10[3], c10[3], ps9[4], p11[3], c10[2]);
fa f105(ps10[4], c10[4], ps9[5], p11[4], c10[3]);
fa f106(ps10[5], c10[5], ps9[6], p11[5], c10[4]);
fa f107(ps10[6], c10[6], ps9[7], p11[6], c10[5]);
fa f108(ps10[7], c10[7], ps9[8], p11[7], c10[6]);
fa f109(ps10[8], c10[8], ps9[9], p11[8], c10[7]);
fa f1010(ps10[9], c10[9], ps9[10], p11[9], c10[8]);
fa f1011(ps10[10], c10[10], ps9[11], p11[10], c10[9]);
fa f1012(ps10[11], c10[11], ps9[12], p11[11], c10[10]);
fa f1013(ps10[12], c10[12], ps9[13], p11[12], c10[11]);
fa f1014(ps10[13], c10[13], ps9[14], p11[13], c10[12]);
fa f1015(ps10[14], c10[14], ps9[15], p11[14], c10[13]);
fa f1016(ps10[15], c10[15], ps9[16], p11[15], c10[14]);
fa f1017(ps10[16], c10[16], ps9[17], p11[16], c10[15]);
fa f1018(ps10[17], c10[17], ps9[18], p11[17], c10[16]);
fa f1019(ps10[18], c10[18], ps9[19], p11[18], c10[17]);
fa f1020(ps10[19], c10[19], ps9[20], p11[19], c10[18]);
fa f1021(ps10[20], c10[20], ps9[21], p11[20], c10[19]);

ha h1101(ps11[0], c11[0], ps10[1], p12[0]);
fa f1102(ps11[1], c11[1], ps10[2], p12[1], c11[0]);
fa f1103(ps11[2], c11[2], ps10[3], p12[2], c11[1]);
fa f1104(ps11[3], c11[3], ps10[4], p12[3], c11[2]);
fa f1105(ps11[4], c11[4], ps10[5], p12[4], c11[3]);
fa f1106(ps11[5], c11[5], ps10[6], p12[5], c11[4]);
fa f1107(ps11[6], c11[6], ps10[7], p12[6], c11[5]);
fa f1108(ps11[7], c11[7], ps10[8], p12[7], c11[6]);
fa f1109(ps11[8], c11[8], ps10[9], p12[8], c11[7]);
fa f1110(ps11[9], c11[9], ps10[10], p12[9], c11[8]);
fa f1111(ps11[10], c11[10], ps10[11], p12[10], c11[9]);
fa f1112(ps11[11], c11[11], ps10[12], p12[11], c11[10]);
fa f1113(ps11[12], c11[12], ps10[13], p12[12], c11[11]);
fa f1114(ps11[13], c11[13], ps10[14], p12[13], c11[12]);
fa f1115(ps11[14], c11[14], ps10[15], p12[14], c11[13]);
fa f1116(ps11[15], c11[15], ps10[16], p12[15], c11[14]);
fa f1117(ps11[16], c11[16], ps10[17], p12[16], c11[15]);
fa f1118(ps11[17], c11[17], ps10[18], p12[17], c11[16]);
fa f1119(ps11[18], c11[18], ps10[19], p12[18], c11[17]);
fa f1120(ps11[19], c11[19], ps10[20], p12[19], c11[18]);

ha h1201(ps12[0], c12[0], ps11[1], p13[0]);
fa f1202(ps12[1], c12[1], ps11[2], p13[1], c12[0]);
fa f1203(ps12[2], c12[2], ps11[3], p13[2], c12[1]);
fa f1204(ps12[3], c12[3], ps11[4], p13[3], c12[2]);
fa f1205(ps12[4], c12[4], ps11[5], p13[4], c12[3]);
fa f1206(ps12[5], c12[5], ps11[6], p13[5], c12[4]);
fa f1207(ps12[6], c12[6], ps11[7], p13[6], c12[5]);
fa f1208(ps12[7], c12[7], ps11[8], p13[7], c12[6]);
fa f1209(ps12[8], c12[8], ps11[9], p13[8], c12[7]);
fa f1210(ps12[9], c12[9], ps11[10], p13[9], c12[8]);
fa f1211(ps12[10], c12[10], ps11[11], p13[10], c12[9]);
fa f1212(ps12[11], c12[11], ps11[12], p13[11], c12[10]);
fa f1213(ps12[12], c12[12], ps11[13], p13[12], c12[11]);
fa f1214(ps12[13], c12[13], ps11[14], p13[13], c12[12]);
fa f1215(ps12[14], c12[14], ps11[15], p13[14], c12[13]);
fa f1216(ps12[15], c12[15], ps11[16], p13[15], c12[14]);
fa f1217(ps12[16], c12[16], ps11[17], p13[16], c12[15]);
fa f1218(ps12[17], c12[17], ps11[18], p13[17], c12[16]);
fa f1219(ps12[18], c12[18], ps11[19], p13[18], c12[17]);

ha h1301(ps13[0], c13[0], ps12[1], p14[0]);
fa f1302(ps13[1], c13[1], ps12[2], p14[1], c13[0]);
fa f1303(ps13[2], c13[2], ps12[3], p14[2], c13[1]);
fa f1304(ps13[3], c13[3], ps12[4], p14[3], c13[2]);
fa f1305(ps13[4], c13[4], ps12[5], p14[4], c13[3]);
fa f1306(ps13[5], c13[5], ps12[6], p14[5], c13[4]);
fa f1307(ps13[6], c13[6], ps12[7], p14[6], c13[5]);
fa f1308(ps13[7], c13[7], ps12[8], p14[7], c13[6]);
fa f1309(ps13[8], c13[8], ps12[9], p14[8], c13[7]);
fa f1310(ps13[9], c13[9], ps12[10], p14[9], c13[8]);
fa f1311(ps13[10], c13[10], ps12[11], p14[10], c13[9]);
fa f1312(ps13[11], c13[11], ps12[12], p14[11], c13[10]);
fa f1313(ps13[12], c13[12], ps12[13], p14[12], c13[11]);
fa f1314(ps13[13], c13[13], ps12[14], p14[13], c13[12]);
fa f1315(ps13[14], c13[14], ps12[15], p14[14], c13[13]);
fa f1316(ps13[15], c13[15], ps12[16], p14[15], c13[14]);
fa f1317(ps13[16], c13[16], ps12[17], p14[16], c13[15]);
fa f1318(ps13[17], c13[17], ps12[18], p14[17], c13[16]);

ha h141(ps14[0], c14[0], ps13[1], p15[0]);
fa f142(ps14[1], c14[1], ps13[2], p15[1], c14[0]);
fa f143(ps14[2], c14[2], ps13[3], p15[2], c14[1]);
fa f144(ps14[3], c14[3], ps13[4], p15[3], c14[2]);
fa f145(ps14[4], c14[4], ps13[5], p15[4], c14[3]);
fa f146(ps14[5], c14[5], ps13[6], p15[5], c14[4]);
fa f147(ps14[6], c14[6], ps13[7], p15[6], c14[5]);
fa f148(ps14[7], c14[7], ps13[8], p15[7], c14[6]);
fa f149(ps14[8], c14[8], ps13[9], p15[8], c14[7]);
fa f1410(ps14[9], c14[9], ps13[10], p15[9], c14[8]);
fa f1411(ps14[10], c14[10], ps13[11], p15[10], c14[9]);
fa f1412(ps14[11], c14[11], ps13[12], p15[11], c14[10]);
fa f1413(ps14[12], c14[12], ps13[13], p15[12], c14[11]);
fa f1414(ps14[13], c14[13], ps13[14], p15[13], c14[12]);
fa f1415(ps14[14], c14[14], ps13[15], p15[14], c14[13]);
fa f1416(ps14[15], c14[15], ps13[16], p15[15], c14[14]);
fa f1417(ps14[16], c14[16], ps13[17], p15[16], c14[15]);

ha h151(ps15[0], c15[0], ps14[1], p16[0]);
fa f152(ps15[1], c15[1], ps14[2], p16[1], c15[0]);
fa f153(ps15[2], c15[2], ps14[3], p16[2], c15[1]);
fa f154(ps15[3], c15[3], ps14[4], p16[3], c15[2]);
fa f155(ps15[4], c15[4], ps14[5], p16[4], c15[3]);
fa f156(ps15[5], c15[5], ps14[6], p16[5], c15[4]);
fa f157(ps15[6], c15[6], ps14[7], p16[6], c15[5]);
fa f158(ps15[7], c15[7], ps14[8], p16[7], c15[6]);
fa f159(ps15[8], c15[8], ps14[9], p16[8], c15[7]);
fa f1510(ps15[9], c15[9], ps14[10], p16[9], c15[8]);
fa f1511(ps15[10], c15[10], ps14[11], p16[10], c15[9]);
fa f1512(ps15[11], c15[11], ps14[12], p16[11], c15[10]);
fa f1513(ps15[12], c15[12], ps14[13], p16[12], c15[11]);
fa f1514(ps15[13], c15[13], ps14[14], p16[13], c15[12]);
fa f1515(ps15[14], c15[14], ps14[15], p16[14], c15[13]);
fa f1516(ps15[15], c15[15], ps14[16], p16[15], c15[14]);

ha h161(ps16[0], c16[0], ps15[1], p17[0]);
fa f162(ps16[1], c16[1], ps15[2], p17[1], c16[0]);
fa f163(ps16[2], c16[2], ps15[3], p17[2], c16[1]);
fa f164(ps16[3], c16[3], ps15[4], p17[3], c16[2]);
fa f165(ps16[4], c16[4], ps15[5], p17[4], c16[3]);
fa f166(ps16[5], c16[5], ps15[6], p17[5], c16[4]);
fa f167(ps16[6], c16[6], ps15[7], p17[6], c16[5]);
fa f168(ps16[7], c16[7], ps15[8], p17[7], c16[6]);
fa f169(ps16[8], c16[8], ps15[9], p17[8], c16[7]);
fa f1610(ps16[9], c16[9], ps15[10], p17[9], c16[8]);
fa f1611(ps16[10], c16[10], ps15[11], p17[10], c16[9]);
fa f1612(ps16[11], c16[11], ps15[12], p17[11], c16[10]);
fa f1613(ps16[12], c16[12], ps15[13], p17[12], c16[11]);
fa f1614(ps16[13], c16[13], ps15[14], p17[13], c16[12]);
fa f1615(ps16[14], c16[14], ps15[15], p17[14], c16[13]);

ha h171(ps17[0], c17[0], ps16[1], p18[0]);
fa f172(ps17[1], c17[1], ps16[2], p18[1], c17[0]);
fa f173(ps17[2], c17[2], ps16[3], p18[2], c17[1]);
fa f174(ps17[3], c17[3], ps16[4], p18[3], c17[2]);
fa f175(ps17[4], c17[4], ps16[5], p18[4], c17[3]);
fa f176(ps17[5], c17[5], ps16[6], p18[5], c17[4]);
fa f177(ps17[6], c17[6], ps16[7], p18[6], c17[5]);
fa f178(ps17[7], c17[7], ps16[8], p18[7], c17[6]);
fa f179(ps17[8], c17[8], ps16[9], p18[8], c17[7]);
fa f1710(ps17[9], c17[9], ps16[10], p18[9], c17[8]);
fa f1711(ps17[10], c17[10], ps16[11], p18[10], c17[9]);
fa f1712(ps17[11], c17[11], ps16[12], p18[11], c17[10]);
fa f1713(ps17[12], c17[12], ps16[13], p18[12], c17[11]);
fa f1714(ps17[13], c17[13], ps16[14], p18[13], c17[12]);

ha h181(ps18[0], c18[0], ps17[1], p19[0]);
fa f182(ps18[1], c18[1], ps17[2], p19[1], c18[0]);
fa f183(ps18[2], c18[2], ps17[3], p19[2], c18[1]);
fa f184(ps18[3], c18[3], ps17[4], p19[3], c18[2]);
fa f185(ps18[4], c18[4], ps17[5], p19[4], c18[3]);
fa f186(ps18[5], c18[5], ps17[6], p19[5], c18[4]);
fa f187(ps18[6], c18[6], ps17[7], p19[6], c18[5]);
fa f188(ps18[7], c18[7], ps17[8], p19[7], c18[6]);
fa f189(ps18[8], c18[8], ps17[9], p19[8], c18[7]);
fa f1810(ps18[9], c18[9], ps17[10], p19[9], c18[8]);
fa f1811(ps18[10], c18[10], ps17[11], p19[10], c18[9]);
fa f1812(ps18[11], c18[11], ps17[12], p19[11], c18[10]);
fa f1813(ps18[12], c18[12], ps17[13], p19[12], c18[11]);

ha h191(ps19[0], c19[0], ps18[1], p20[0]);
fa f192(ps19[1], c19[1], ps18[2], p20[1], c19[0]);
fa f193(ps19[2], c19[2], ps18[3], p20[2], c19[1]);
fa f194(ps19[3], c19[3], ps18[4], p20[3], c19[2]);
fa f195(ps19[4], c19[4], ps18[5], p20[4], c19[3]);
fa f196(ps19[5], c19[5], ps18[6], p20[5], c19[4]);
fa f197(ps19[6], c19[6], ps18[7], p20[6], c19[5]);
fa f198(ps19[7], c19[7], ps18[8], p20[7], c19[6]);
fa f199(ps19[8], c19[8], ps18[9], p20[8], c19[7]);
fa f1910(ps19[9], c19[9], ps18[10], p20[9], c19[8]);
fa f1911(ps19[10], c19[10], ps18[11], p20[10], c19[9]);
fa f1912(ps19[11], c19[11], ps18[12], p20[11], c19[10]);

ha h201(ps20[0], c20[0], ps19[1], p21[0]);
fa f202(ps20[1], c20[1], ps19[2], p21[1], c20[0]);
fa f203(ps20[2], c20[2], ps19[3], p21[2], c20[1]);
fa f204(ps20[3], c20[3], ps19[4], p21[3], c20[2]);
fa f205(ps20[4], c20[4], ps19[5], p21[4], c20[3]);
fa f206(ps20[5], c20[5], ps19[6], p21[5], c20[4]);
fa f207(ps20[6], c20[6], ps19[7], p21[6], c20[5]);
fa f208(ps20[7], c20[7], ps19[8], p21[7], c20[6]);
fa f209(ps20[8], c20[8], ps19[9], p21[8], c20[7]);
fa f2010(ps20[9], c20[9], ps19[10], p21[9], c20[8]);
fa f2011(ps20[10], c20[10], ps19[11], p21[10], c20[9]);

ha h2101(ps21[0], c21[0], ps20[1], p22[0]);
fa f2102(ps21[1], c21[1], ps20[2], p22[1], c21[0]);
fa f2103(ps21[2], c21[2], ps20[3], p22[2], c21[1]);
fa f2104(ps21[3], c21[3], ps20[4], p22[3], c21[2]);
fa f2105(ps21[4], c21[4], ps20[5], p22[4], c21[3]);
fa f2106(ps21[5], c21[5], ps20[6], p22[5], c21[4]);
fa f2107(ps21[6], c21[6], ps20[7], p22[6], c21[5]);
fa f2108(ps21[7], c21[7], ps20[8], p22[7], c21[6]);
fa f2109(ps21[8], c21[8], ps20[9], p22[8], c21[7]);
fa f2110(ps21[9], c21[9], ps20[10], p22[9], c21[8]);

ha h2201(ps22[0], c22[0], ps21[1], p23[0]);
fa f2202(ps22[1], c22[1], ps21[2], p23[1], c22[0]);
fa f2203(ps22[2], c22[2], ps21[3], p23[2], c22[1]);
fa f2204(ps22[3], c22[3], ps21[4], p23[3], c22[2]);
fa f2205(ps22[4], c22[4], ps21[5], p23[4], c22[3]);
fa f2206(ps22[5], c22[5], ps21[6], p23[5], c22[4]);
fa f2207(ps22[6], c22[6], ps21[7], p23[6], c22[5]);
fa f2208(ps22[7], c22[7], ps21[8], p23[7], c22[6]);
fa f2209(ps22[8], c22[8], ps21[9], p23[8], c22[7]);

ha h2301(ps23[0], c23[0], ps22[1], p24[0]);
fa f2302(ps23[1], c23[1], ps22[2], p24[1], c23[0]);
fa f2303(ps23[2], c23[2], ps22[3], p24[2], c23[1]);
fa f2304(ps23[3], c23[3], ps22[4], p24[3], c23[2]);
fa f2305(ps23[4], c23[4], ps22[5], p24[4], c23[3]);
fa f2306(ps23[5], c23[5], ps22[6], p24[5], c23[4]);
fa f2307(ps23[6], c23[6], ps22[7], p24[6], c23[5]);
fa f2308(ps23[7], c23[7], ps22[8], p24[7], c23[6]);

ha h241(ps24[0], c24[0], ps23[1], p25[0]);
fa f242(ps24[1], c24[1], ps23[2], p25[1], c24[0]);
fa f243(ps24[2], c24[2], ps23[3], p25[2], c24[1]);
fa f244(ps24[3], c24[3], ps23[4], p25[3], c24[2]);
fa f245(ps24[4], c24[4], ps23[5], p25[4], c24[3]);
fa f246(ps24[5], c24[5], ps23[6], p25[5], c24[4]);
fa f247(ps24[6], c24[6], ps23[7], p25[6], c24[5]);

ha h251(ps25[0], c25[0], ps24[1], p26[0]);
fa f252(ps25[1], c25[1], ps24[2], p26[1], c25[0]);
fa f253(ps25[2], c25[2], ps24[3], p26[2], c25[1]);
fa f254(ps25[3], c25[3], ps24[4], p26[3], c25[2]);
fa f255(ps25[4], c25[4], ps24[5], p26[4], c25[3]);
fa f256(ps25[5], c25[5], ps24[6], p26[5], c25[4]);

ha h261(ps26[0], c26[0], ps25[1], p27[0]);
fa f262(ps26[1], c26[1], ps25[2], p27[1], c26[0]);
fa f263(ps26[2], c26[2], ps25[3], p27[2], c26[1]);
fa f264(ps26[3], c26[3], ps25[4], p27[3], c26[2]);
fa f265(ps26[4], c26[4], ps25[5], p27[4], c26[3]);

ha h271(ps27[0], c27[0], ps26[1], p28[0]);
fa f272(ps27[1], c27[1], ps26[2], p28[1], c27[0]);
fa f273(ps27[2], c27[2], ps26[3], p28[2], c27[1]);
fa f274(ps27[3], c27[3], ps26[4], p28[3], c27[2]);

ha h281(ps28[0], c28[0], ps27[1], p29[0]);
fa f282(ps28[1], c28[1], ps27[2], p29[1], c28[0]);
fa f283(ps28[2], c28[2], ps27[3], p29[2], c28[1]);

ha h291(ps29[0], c29[0], ps28[1], p30[0]);
fa f292(ps29[1], c29[1], ps28[2], p30[1], c29[0]);

ha h301(ps30[0], c30[0], ps29[1], p31[0]);


assign lsb={ps30[0], ps29[0],ps28[0],ps27[0], ps26[0], ps25[0], ps24[0],ps23[0],ps22[0],ps21[0],ps20[0], ps19[0], ps18[0], ps17[0],ps16[0],ps15[0],ps14[0],ps13[0], ps12[0], ps11[0], ps10[0],ps9[0],ps8[0],ps7[0],ps6[0], ps5[0], ps4[0], ps3[0],ps2[0],ps1[0],ps0[0],p0[0]};

dreg rc1(c0[30], clk, c030);
dreg rc2(c1[29], clk, c129);
dreg rc3(c2[28], clk, c228);
dreg rc4(c3[27], clk, c327);
dreg rc5(c4[26], clk, c426);
dreg rc6(c5[25], clk, c525);
dreg rc7(c6[24], clk, c624);
dreg rc8(c7[23], clk, c723);
dreg rc9(c8[22], clk, c822);
dreg rc10(c9[21], clk, c921);
dreg rc11(c10[20], clk, c1020);
dreg rc12(c11[19], clk, c1119);
dreg rc13(c12[18], clk, c1218);
dreg rc14(c13[17], clk, c1317);
dreg rc15(c14[16], clk, c1416);
dreg rc16(c15[15], clk, c1515);
dreg rc17(c16[14], clk, c1614);
dreg rc18(c17[13], clk, c1713);
dreg rc19(c18[12], clk, c1812);
dreg rc20(c19[11], clk, c1911);
dreg rc21(c20[10], clk, c2010);
dreg rc22(c21[9], clk, c219);
dreg rc23(c22[8], clk, c2028);
dreg rc24(c23[7], clk, c237);
dreg rc25(c24[6], clk, c246);
dreg rc26(c25[5], clk, c255);
dreg rc27(c26[4], clk, c264);
dreg rc28(c27[3], clk, c273);
dreg rc29(c28[2], clk, c282);
dreg rc30(c29[1], clk, c291);
dreg rc31(c30[0], clk, c300);

dreg_32bit r1(p0, clk, pp0);
dreg_32bit r2(p1, clk, pp1);
dreg_32bit r3(p2, clk, pp2);
dreg_32bit r4(p3, clk, pp3);
dreg_32bit r5(p4, clk, pp4);
dreg_32bit r6(p5, clk, pp5);
dreg_32bit r7(p6, clk, pp6);
dreg_32bit r8(p7, clk, pp7);
dreg_32bit r9(p8, clk, pp8);
dreg_32bit r10(p9, clk, pp9);
dreg_32bit r11(p10, clk, pp10);
dreg_32bit r12(p11, clk, pp11);
dreg_32bit r13(p12, clk, pp12);
dreg_32bit r14(p13, clk, pp13);
dreg_32bit r15(p14, clk, pp14);
dreg_32bit r16(p15, clk, pp15);
dreg_32bit r17(p16, clk, pp16);
dreg_32bit r18(p17, clk, pp17);
dreg_32bit r19(p18, clk, pp18);
dreg_32bit r20(p19, clk, pp19);
dreg_32bit r21(p20, clk, pp20);
dreg_32bit r22(p21, clk, pp21);
dreg_32bit r23(p22, clk, pp22);
dreg_32bit r24(p23, clk, pp23);
dreg_32bit r25(p24, clk, pp24);
dreg_32bit r26(p25, clk, pp25);
dreg_32bit r27(p26, clk, pp26);
dreg_32bit r28(p27, clk, pp27);
dreg_32bit r29(p28, clk, pp28);
dreg_32bit r30(p29, clk, pp29);
dreg_32bit r31(p30, clk, pp30);
dreg_32bit r32(p31, clk, pp31);

ha f032(ps0[31], c0[31], c030, pp1[31]);

fa f131(ps1[30], c1[30], ps0[31], pp2[30], c129);
fa f132(ps1[31], c1[31], c0[31], pp2[31], c1[30]);

fa f230(ps2[29], c2[29], ps1[30], pp3[29], c228);
fa f231(ps2[30], c2[30], ps1[31], pp3[30], c2[29]);
fa f232(ps2[31], c2[31], c1[31], pp3[31], c2[30]);

fa f329(ps3[28], c3[28], ps2[29], pp4[28], c327);
fa f330(ps3[29], c3[29], ps2[30], pp4[29], c3[28]);
fa f331(ps3[30], c3[30], ps2[31], pp4[30], c3[29]);
fa f332(ps3[31], c3[31], c2[31], pp4[31], c3[30]);

fa f428(ps4[27], c4[27], ps3[28], pp5[27], c426);
fa f429(ps4[28], c4[28], ps3[29], pp5[28], c4[27]);
fa f430(ps4[29], c4[29], ps3[30], pp5[29], c4[28]);
fa f431(ps4[30], c4[30], ps3[31], pp5[30], c4[29]);
fa f432(ps4[31], c4[31], c3[31], pp5[31], c4[30]);

fa f527(ps5[26], c5[26], ps4[27], pp6[26], c525);
fa f528(ps5[27], c5[27], ps4[28], pp6[27], c5[26]);
fa f529(ps5[28], c5[28], ps4[29], pp6[28], c5[27]);
fa f530(ps5[29], c5[29], ps4[30], pp6[29], c5[28]);
fa f531(ps5[30], c5[30], ps4[31], pp6[30], c5[29]);
fa f532(ps5[31], c5[31], c4[31], pp6[31], c5[30]);

fa f626(ps6[25], c6[25], ps5[26], pp7[25], c624);
fa f627(ps6[26], c6[26], ps5[27], pp7[26], c6[25]);
fa f628(ps6[27], c6[27], ps5[28], pp7[27], c6[26]);
fa f629(ps6[28], c6[28], ps5[29], pp7[28], c6[27]);
fa f630(ps6[29], c6[29], ps5[30], pp7[29], c6[28]);
fa f631(ps6[30], c6[30], ps5[31], pp7[30], c6[29]);
fa f632(ps6[31], c6[31], c5[31], pp7[31], c6[30]);

fa f725(ps7[24], c7[24], ps6[25], pp8[24], c723);
fa f726(ps7[25], c7[25], ps6[26], pp8[25], c7[24]);
fa f727(ps7[26], c7[26], ps6[27], pp8[26], c7[25]);
fa f728(ps7[27], c7[27], ps6[28], pp8[27], c7[26]);
fa f729(ps7[28], c7[28], ps6[29], pp8[28], c7[27]);
fa f730(ps7[29], c7[29], ps6[30], pp8[29], c7[28]);
fa f731(ps7[30], c7[30], ps6[31], pp8[30], c7[29]);
fa f732(ps7[31], c7[31], c6[31], pp8[31], c7[30]);

fa f824(ps8[23], c8[23], ps7[24], pp9[23], c822);
fa f825(ps8[24], c8[24], ps7[25], pp9[24], c8[23]);
fa f826(ps8[25], c8[25], ps7[26], pp9[25], c8[24]);
fa f827(ps8[26], c8[26], ps7[27], pp9[26], c8[25]);
fa f828(ps8[27], c8[27], ps7[28], pp9[27], c8[26]);
fa f829(ps8[28], c8[28], ps7[29], pp9[28], c8[27]);
fa f830(ps8[29], c8[29], ps7[30], pp9[29], c8[28]);
fa f831(ps8[30], c8[30], ps7[31], pp9[30], c8[29]);
fa f832(ps8[31], c8[31], c7[31], pp9[31], c8[30]);

fa f923(ps9[22], c9[22], ps8[23], pp10[22], c921);
fa f924(ps9[23], c9[23], ps8[24], pp10[23], c9[22]);
fa f925(ps9[24], c9[24], ps8[25], pp10[24], c9[23]);
fa f926(ps9[25], c9[25], ps8[26], pp10[25], c9[24]);
fa f927(ps9[26], c9[26], ps8[27], pp10[26], c9[25]);
fa f928(ps9[27], c9[27], ps8[28], pp10[27], c9[26]);
fa f929(ps9[28], c9[28], ps8[29], pp10[28], c9[27]);
fa f930(ps9[29], c9[29], ps8[30], pp10[29], c9[28]);
fa f931(ps9[30], c9[30], ps8[31], pp10[30], c9[29]);
fa f932(ps9[31], c9[31], c8[31], pp10[31], c9[30]);

fa f1022(ps10[21], c10[21], ps9[22], pp11[21], c1020);
fa f1023(ps10[22], c10[22], ps9[23], pp11[22], c10[21]);
fa f1024(ps10[23], c10[23], ps9[24], pp11[23], c10[22]);
fa f1025(ps10[24], c10[24], ps9[25], pp11[24], c10[23]);
fa f1026(ps10[25], c10[25], ps9[26], pp11[25], c10[24]);
fa f1027(ps10[26], c10[26], ps9[27], pp11[26], c10[25]);
fa f1028(ps10[27], c10[27], ps9[28], pp11[27], c10[26]);
fa f1029(ps10[28], c10[28], ps9[29], pp11[28], c10[27]);
fa f1030(ps10[29], c10[29], ps9[30], pp11[29], c10[28]);
fa f1031(ps10[30], c10[30], ps9[31], pp11[30], c10[29]);
fa f1032(ps10[31], c10[31], c9[31], pp11[31], c10[30]);

fa f1121(ps11[20], c11[20], ps10[21], pp12[20], c1119);
fa f1122(ps11[21], c11[21], ps10[22], pp12[21], c11[20]);
fa f1123(ps11[22], c11[22], ps10[23], pp12[22], c11[21]);
fa f1124(ps11[23], c11[23], ps10[24], pp12[23], c11[22]);
fa f1125(ps11[24], c11[24], ps10[25], pp12[24], c11[23]);
fa f1126(ps11[25], c11[25], ps10[26], pp12[25], c11[24]);
fa f1127(ps11[26], c11[26], ps10[27], pp12[26], c11[25]);
fa f1128(ps11[27], c11[27], ps10[28], pp12[27], c11[26]);
fa f1129(ps11[28], c11[28], ps10[29], pp12[28], c11[27]);
fa f1130(ps11[29], c11[29], ps10[30], pp12[29], c11[28]);
fa f1131(ps11[30], c11[30], ps10[31], pp12[30], c11[29]);
fa f1132(ps11[31], c11[31], c10[31], pp12[31], c11[30]);

fa f1220(ps12[19], c12[19], ps11[20], pp13[19], c1218);
fa f1221(ps12[20], c12[20], ps11[21], pp13[20], c12[19]);
fa f1222(ps12[21], c12[21], ps11[22], pp13[21], c12[20]);
fa f1223(ps12[22], c12[22], ps11[23], pp13[22], c12[21]);
fa f1224(ps12[23], c12[23], ps11[24], pp13[23], c12[22]);
fa f1225(ps12[24], c12[24], ps11[25], pp13[24], c12[23]);
fa f1226(ps12[25], c12[25], ps11[26], pp13[25], c12[24]);
fa f1227(ps12[26], c12[26], ps11[27], pp13[26], c12[25]);
fa f1228(ps12[27], c12[27], ps11[28], pp13[27], c12[26]);
fa f1229(ps12[28], c12[28], ps11[29], pp13[28], c12[27]);
fa f1230(ps12[29], c12[29], ps11[30], pp13[29], c12[28]);
fa f1231(ps12[30], c12[30], ps11[31], pp13[30], c12[29]);
fa f1232(ps12[31], c12[31], c11[31], pp13[31], c12[30]);

fa f1319(ps13[18], c13[18], ps12[19], pp14[18], c1317);
fa f1320(ps13[19], c13[19], ps12[20], pp14[19], c13[18]);
fa f1321(ps13[20], c13[20], ps12[21], pp14[20], c13[19]);
fa f1322(ps13[21], c13[21], ps12[22], pp14[21], c13[20]);
fa f1323(ps13[22], c13[22], ps12[23], pp14[22], c13[21]);
fa f1324(ps13[23], c13[23], ps12[24], pp14[23], c13[22]);
fa f1325(ps13[24], c13[24], ps12[25], pp14[24], c13[23]);
fa f1326(ps13[25], c13[25], ps12[26], pp14[25], c13[24]);
fa f1327(ps13[26], c13[26], ps12[27], pp14[26], c13[25]);
fa f1328(ps13[27], c13[27], ps12[28], pp14[27], c13[26]);
fa f1329(ps13[28], c13[28], ps12[29], pp14[28], c13[27]);
fa f1330(ps13[29], c13[29], ps12[30], pp14[29], c13[28]);
fa f1331(ps13[30], c13[30], ps12[31], pp14[30], c13[29]);
fa f1332(ps13[31], c13[31], c12[31], pp14[31], c13[30]);

fa f1418(ps14[17], c14[17], ps13[18], pp15[17], c1416);
fa f1419(ps14[18], c14[18], ps13[19], pp15[18], c14[17]);
fa f1420(ps14[19], c14[19], ps13[20], pp15[19], c14[18]);
fa f1421(ps14[20], c14[20], ps13[21], pp15[20], c14[19]);
fa f1422(ps14[21], c14[21], ps13[22], pp15[21], c14[20]);
fa f1423(ps14[22], c14[22], ps13[23], pp15[22], c14[21]);
fa f1424(ps14[23], c14[23], ps13[24], pp15[23], c14[22]);
fa f1425(ps14[24], c14[24], ps13[25], pp15[24], c14[23]);
fa f1426(ps14[25], c14[25], ps13[26], pp15[25], c14[24]);
fa f1427(ps14[26], c14[26], ps13[27], pp15[26], c14[25]);
fa f1428(ps14[27], c14[27], ps13[28], pp15[27], c14[26]);
fa f1429(ps14[28], c14[28], ps13[29], pp15[28], c14[27]);
fa f1430(ps14[29], c14[29], ps13[30], pp15[29], c14[28]);
fa f1431(ps14[30], c14[30], ps13[31], pp15[30], c14[29]);
fa f1432(ps14[31], c14[31], c13[31], pp15[31], c14[30]);

fa f1517(ps15[16], c15[16], ps14[17], pp16[16], c1515);
fa f1518(ps15[17], c15[17], ps14[18], pp16[17], c15[16]);
fa f1519(ps15[18], c15[18], ps14[19], pp16[18], c15[17]);
fa f1520(ps15[19], c15[19], ps14[20], pp16[19], c15[18]);
fa f1521(ps15[20], c15[20], ps14[21], pp16[20], c15[19]);
fa f1522(ps15[21], c15[21], ps14[22], pp16[21], c15[20]);
fa f1523(ps15[22], c15[22], ps14[23], pp16[22], c15[21]);
fa f1524(ps15[23], c15[23], ps14[24], pp16[23], c15[22]);
fa f1525(ps15[24], c15[24], ps14[25], pp16[24], c15[23]);
fa f1526(ps15[25], c15[25], ps14[26], pp16[25], c15[24]);
fa f1527(ps15[26], c15[26], ps14[27], pp16[26], c15[25]);
fa f1528(ps15[27], c15[27], ps14[28], pp16[27], c15[26]);
fa f1529(ps15[28], c15[28], ps14[29], pp16[28], c15[27]);
fa f1530(ps15[29], c15[29], ps14[30], pp16[29], c15[28]);
fa f1531(ps15[30], c15[30], ps14[31], pp16[30], c15[29]);
fa f1532(ps15[31], c15[31], c14[31], pp16[31], c15[30]);

fa f1616(ps16[15], c16[15], ps15[16], pp17[15], c1614);
fa f1617(ps16[16], c16[16], ps15[17], pp17[16], c16[15]);
fa f1618(ps16[17], c16[17], ps15[18], pp17[17], c16[16]);
fa f1619(ps16[18], c16[18], ps15[19], pp17[18], c16[17]);
fa f1620(ps16[19], c16[19], ps15[20], pp17[19], c16[18]);
fa f1621(ps16[20], c16[20], ps15[21], pp17[20], c16[19]);
fa f1622(ps16[21], c16[21], ps15[22], pp17[21], c16[20]);
fa f1623(ps16[22], c16[22], ps15[23], pp17[22], c16[21]);
fa f1624(ps16[23], c16[23], ps15[24], pp17[23], c16[22]);
fa f1625(ps16[24], c16[24], ps15[25], pp17[24], c16[23]);
fa f1626(ps16[25], c16[25], ps15[26], pp17[25], c16[24]);
fa f1627(ps16[26], c16[26], ps15[27], pp17[26], c16[25]);
fa f1628(ps16[27], c16[27], ps15[28], pp17[27], c16[26]);
fa f1629(ps16[28], c16[28], ps15[29], pp17[28], c16[27]);
fa f1630(ps16[29], c16[29], ps15[30], pp17[29], c16[28]);
fa f1631(ps16[30], c16[30], ps15[31], pp17[30], c16[29]);
fa f1632(ps16[31], c16[31], c15[31], pp17[31], c16[30]);

fa f1715(ps17[14], c17[14], ps16[15], pp18[14], c1713);
fa f1716(ps17[15], c17[15], ps16[16], pp18[15], c17[14]);
fa f1717(ps17[16], c17[16], ps16[17], pp18[16], c17[15]);
fa f1718(ps17[17], c17[17], ps16[18], pp18[17], c17[16]);
fa f1719(ps17[18], c17[18], ps16[19], pp18[18], c17[17]);
fa f1720(ps17[19], c17[19], ps16[20], pp18[19], c17[18]);
fa f1721(ps17[20], c17[20], ps16[21], pp18[20], c17[19]);
fa f1722(ps17[21], c17[21], ps16[22], pp18[21], c17[20]);
fa f1723(ps17[22], c17[22], ps16[23], pp18[22], c17[21]);
fa f1724(ps17[23], c17[23], ps16[24], pp18[23], c17[22]);
fa f1725(ps17[24], c17[24], ps16[25], pp18[24], c17[23]);
fa f1726(ps17[25], c17[25], ps16[26], pp18[25], c17[24]);
fa f1727(ps17[26], c17[26], ps16[27], pp18[26], c17[25]);
fa f1728(ps17[27], c17[27], ps16[28], pp18[27], c17[26]);
fa f1729(ps17[28], c17[28], ps16[29], pp18[28], c17[27]);
fa f1730(ps17[29], c17[29], ps16[30], pp18[29], c17[28]);
fa f1731(ps17[30], c17[30], ps16[31], pp18[30], c17[29]);
fa f1732(ps17[31], c17[31], c16[31], pp18[31], c17[30]);

fa f1814(ps18[13], c18[13], ps17[14], pp19[13], c1812);
fa f1815(ps18[14], c18[14], ps17[15], pp19[14], c18[13]);
fa f1816(ps18[15], c18[15], ps17[16], pp19[15], c18[14]);
fa f1817(ps18[16], c18[16], ps17[17], pp19[16], c18[15]);
fa f1818(ps18[17], c18[17], ps17[18], pp19[17], c18[16]);
fa f1819(ps18[18], c18[18], ps17[19], pp19[18], c18[17]);
fa f1820(ps18[19], c18[19], ps17[20], pp19[19], c18[18]);
fa f1821(ps18[20], c18[20], ps17[21], pp19[20], c18[19]);
fa f1822(ps18[21], c18[21], ps17[22], pp19[21], c18[20]);
fa f1823(ps18[22], c18[22], ps17[23], pp19[22], c18[21]);
fa f1824(ps18[23], c18[23], ps17[24], pp19[23], c18[22]);
fa f1825(ps18[24], c18[24], ps17[25], pp19[24], c18[23]);
fa f1826(ps18[25], c18[25], ps17[26], pp19[25], c18[24]);
fa f1827(ps18[26], c18[26], ps17[27], pp19[26], c18[25]);
fa f1828(ps18[27], c18[27], ps17[28], pp19[27], c18[26]);
fa f1829(ps18[28], c18[28], ps17[29], pp19[28], c18[27]);
fa f1830(ps18[29], c18[29], ps17[30], pp19[29], c18[28]);
fa f1831(ps18[30], c18[30], ps17[31], pp19[30], c18[29]);
fa f1832(ps18[31], c18[31], c17[31], pp19[31], c18[30]);

fa f1913(ps19[12], c19[12], ps18[13], pp20[12], c1911);
fa f1914(ps19[13], c19[13], ps18[14], pp20[13], c19[12]);
fa f1915(ps19[14], c19[14], ps18[15], pp20[14], c19[13]);
fa f1916(ps19[15], c19[15], ps18[16], pp20[15], c19[14]);
fa f1917(ps19[16], c19[16], ps18[17], pp20[16], c19[15]);
fa f1918(ps19[17], c19[17], ps18[18], pp20[17], c19[16]);
fa f1919(ps19[18], c19[18], ps18[19], pp20[18], c19[17]);
fa f1920(ps19[19], c19[19], ps18[20], pp20[19], c19[18]);
fa f1921(ps19[20], c19[20], ps18[21], pp20[20], c19[19]);
fa f1922(ps19[21], c19[21], ps18[22], pp20[21], c19[20]);
fa f1923(ps19[22], c19[22], ps18[23], pp20[22], c19[21]);
fa f1924(ps19[23], c19[23], ps18[24], pp20[23], c19[22]);
fa f1925(ps19[24], c19[24], ps18[25], pp20[24], c19[23]);
fa f1926(ps19[25], c19[25], ps18[26], pp20[25], c19[24]);
fa f1927(ps19[26], c19[26], ps18[27], pp20[26], c19[25]);
fa f1928(ps19[27], c19[27], ps18[28], pp20[27], c19[26]);
fa f1929(ps19[28], c19[28], ps18[29], pp20[28], c19[27]);
fa f1930(ps19[29], c19[29], ps18[30], pp20[29], c19[28]);
fa f1931(ps19[30], c19[30], ps18[31], pp20[30], c19[29]);
fa f1932(ps19[31], c19[31], c18[31], pp20[31], c19[30]);

fa f2012(ps20[11], c20[11], ps19[12], pp21[11], c2010);
fa f2013(ps20[12], c20[12], ps19[13], pp21[12], c20[11]);
fa f2014(ps20[13], c20[13], ps19[14], pp21[13], c20[12]);
fa f2015(ps20[14], c20[14], ps19[15], pp21[14], c20[13]);
fa f2016(ps20[15], c20[15], ps19[16], pp21[15], c20[14]);
fa f2017(ps20[16], c20[16], ps19[17], pp21[16], c20[15]);
fa f2018(ps20[17], c20[17], ps19[18], pp21[17], c20[16]);
fa f2019(ps20[18], c20[18], ps19[19], pp21[18], c20[17]);
fa f2020(ps20[19], c20[19], ps19[20], pp21[19], c20[18]);
fa f2021(ps20[20], c20[20], ps19[21], pp21[20], c20[19]);
fa f2022(ps20[21], c20[21], ps19[22], pp21[21], c20[20]);
fa f2023(ps20[22], c20[22], ps19[23], pp21[22], c20[21]);
fa f2024(ps20[23], c20[23], ps19[24], pp21[23], c20[22]);
fa f2025(ps20[24], c20[24], ps19[25], pp21[24], c20[23]);
fa f2026(ps20[25], c20[25], ps19[26], pp21[25], c20[24]);
fa f2027(ps20[26], c20[26], ps19[27], pp21[26], c20[25]);
fa f2028(ps20[27], c20[27], ps19[28], pp21[27], c20[26]);
fa f2029(ps20[28], c20[28], ps19[29], pp21[28], c20[27]);
fa f2030(ps20[29], c20[29], ps19[30], pp21[29], c20[28]);
fa f2031(ps20[30], c20[30], ps19[31], pp21[30], c20[29]);
fa f2032(ps20[31], c20[31], c19[31], pp21[31], c20[30]);

fa f2111(ps21[10], c21[10], ps20[11], pp22[10], c219);
fa f2112(ps21[11], c21[11], ps20[12], pp22[11], c21[10]);
fa f2113(ps21[12], c21[12], ps20[13], pp22[12], c21[11]);
fa f2114(ps21[13], c21[13], ps20[14], pp22[13], c21[12]);
fa f2115(ps21[14], c21[14], ps20[15], pp22[14], c21[13]);
fa f2116(ps21[15], c21[15], ps20[16], pp22[15], c21[14]);
fa f2117(ps21[16], c21[16], ps20[17], pp22[16], c21[15]);
fa f2118(ps21[17], c21[17], ps20[18], pp22[17], c21[16]);
fa f2119(ps21[18], c21[18], ps20[19], pp22[18], c21[17]);
fa f2120(ps21[19], c21[19], ps20[20], pp22[19], c21[18]);
fa f2121(ps21[20], c21[20], ps20[21], pp22[20], c21[19]);
fa f2122(ps21[21], c21[21], ps20[22], pp22[21], c21[20]);
fa f2123(ps21[22], c21[22], ps20[23], pp22[22], c21[21]);
fa f2124(ps21[23], c21[23], ps20[24], pp22[23], c21[22]);
fa f2125(ps21[24], c21[24], ps20[25], pp22[24], c21[23]);
fa f2126(ps21[25], c21[25], ps20[26], pp22[25], c21[24]);
fa f2127(ps21[26], c21[26], ps20[27], pp22[26], c21[25]);
fa f2128(ps21[27], c21[27], ps20[28], pp22[27], c21[26]);
fa f2129(ps21[28], c21[28], ps20[29], pp22[28], c21[27]);
fa f2130(ps21[29], c21[29], ps20[30], pp22[29], c21[28]);
fa f2131(ps21[30], c21[30], ps20[31], pp22[30], c21[29]);
fa f2132(ps21[31], c21[31], c20[31], pp22[31], c21[30]);

fa f2210(ps22[9], c22[9], ps21[10], pp23[9], c228);
fa f2211(ps22[10], c22[10], ps21[11], pp23[10], c22[9]);
fa f2212(ps22[11], c22[11], ps21[12], pp23[11], c22[10]);
fa f2213(ps22[12], c22[12], ps21[13], pp23[12], c22[11]);
fa f2214(ps22[13], c22[13], ps21[14], pp23[13], c22[12]);
fa f2215(ps22[14], c22[14], ps21[15], pp23[14], c22[13]);
fa f2216(ps22[15], c22[15], ps21[16], pp23[15], c22[14]);
fa f2217(ps22[16], c22[16], ps21[17], pp23[16], c22[15]);
fa f2218(ps22[17], c22[17], ps21[18], pp23[17], c22[16]);
fa f2219(ps22[18], c22[18], ps21[19], pp23[18], c22[17]);
fa f2220(ps22[19], c22[19], ps21[20], pp23[19], c22[18]);
fa f2221(ps22[20], c22[20], ps21[21], pp23[20], c22[19]);
fa f2222(ps22[21], c22[21], ps21[22], pp23[21], c22[20]);
fa f2223(ps22[22], c22[22], ps21[23], pp23[22], c22[21]);
fa f2224(ps22[23], c22[23], ps21[24], pp23[23], c22[22]);
fa f2225(ps22[24], c22[24], ps21[25], pp23[24], c22[23]);
fa f2226(ps22[25], c22[25], ps21[26], pp23[25], c22[24]);
fa f2227(ps22[26], c22[26], ps21[27], pp23[26], c22[25]);
fa f2228(ps22[27], c22[27], ps21[28], pp23[27], c22[26]);
fa f2229(ps22[28], c22[28], ps21[29], pp23[28], c22[27]);
fa f2230(ps22[29], c22[29], ps21[30], pp23[29], c22[28]);
fa f2231(ps22[30], c22[30], ps21[31], pp23[30], c22[29]);
fa f2232(ps22[31], c22[31], c21[31], pp23[31], c22[30]);

fa f2309(ps23[8], c23[8], ps22[9], pp24[8], c237);
fa f2310(ps23[9], c23[9], ps22[10], pp24[9], c23[8]);
fa f2311(ps23[10], c23[10], ps22[11], pp24[10], c23[9]);
fa f2312(ps23[11], c23[11], ps22[12], pp24[11], c23[10]);
fa f2313(ps23[12], c23[12], ps22[13], pp24[12], c23[11]);
fa f2314(ps23[13], c23[13], ps22[14], pp24[13], c23[12]);
fa f2315(ps23[14], c23[14], ps22[15], pp24[14], c23[13]);
fa f2316(ps23[15], c23[15], ps22[16], pp24[15], c23[14]);
fa f2317(ps23[16], c23[16], ps22[17], pp24[16], c23[15]);
fa f2318(ps23[17], c23[17], ps22[18], pp24[17], c23[16]);
fa f2319(ps23[18], c23[18], ps22[19], pp24[18], c23[17]);
fa f2320(ps23[19], c23[19], ps22[20], pp24[19], c23[18]);
fa f2321(ps23[20], c23[20], ps22[21], pp24[20], c23[19]);
fa f2322(ps23[21], c23[21], ps22[22], pp24[21], c23[20]);
fa f2323(ps23[22], c23[22], ps22[23], pp24[22], c23[21]);
fa f2324(ps23[23], c23[23], ps22[24], pp24[23], c23[22]);
fa f2325(ps23[24], c23[24], ps22[25], pp24[24], c23[23]);
fa f2326(ps23[25], c23[25], ps22[26], pp24[25], c23[24]);
fa f2327(ps23[26], c23[26], ps22[27], pp24[26], c23[25]);
fa f2328(ps23[27], c23[27], ps22[28], pp24[27], c23[26]);
fa f2329(ps23[28], c23[28], ps22[29], pp24[28], c23[27]);
fa f2330(ps23[29], c23[29], ps22[30], pp24[29], c23[28]);
fa f2331(ps23[30], c23[30], ps22[31], pp24[30], c23[29]);
fa f2332(ps23[31], c23[31], c22[31], pp24[31], c23[30]);

fa f2408(ps24[7], c24[7], ps23[8], pp25[7], c246);
fa f2409(ps24[8], c24[8], ps23[9], pp25[8], c24[7]);
fa f2410(ps24[9], c24[9], ps23[10], pp25[9], c24[8]);
fa f2411(ps24[10], c24[10], ps23[11], pp25[10], c24[9]);
fa f2412(ps24[11], c24[11], ps23[12], pp25[11], c24[10]);
fa f2413(ps24[12], c24[12], ps23[13], pp25[12], c24[11]);
fa f2414(ps24[13], c24[13], ps23[14], pp25[13], c24[12]);
fa f2415(ps24[14], c24[14], ps23[15], pp25[14], c24[13]);
fa f2416(ps24[15], c24[15], ps23[16], pp25[15], c24[14]);
fa f2417(ps24[16], c24[16], ps23[17], pp25[16], c24[15]);
fa f2418(ps24[17], c24[17], ps23[18], pp25[17], c24[16]);
fa f2419(ps24[18], c24[18], ps23[19], pp25[18], c24[17]);
fa f2420(ps24[19], c24[19], ps23[20], pp25[19], c24[18]);
fa f2421(ps24[20], c24[20], ps23[21], pp25[20], c24[19]);
fa f2422(ps24[21], c24[21], ps23[22], pp25[21], c24[20]);
fa f2423(ps24[22], c24[22], ps23[23], pp25[22], c24[21]);
fa f2424(ps24[23], c24[23], ps23[24], pp25[23], c24[22]);
fa f2425(ps24[24], c24[24], ps23[25], pp25[24], c24[23]);
fa f2426(ps24[25], c24[25], ps23[26], pp25[25], c24[24]);
fa f2427(ps24[26], c24[26], ps23[27], pp25[26], c24[25]);
fa f2428(ps24[27], c24[27], ps23[28], pp25[27], c24[26]);
fa f2429(ps24[28], c24[28], ps23[29], pp25[28], c24[27]);
fa f2430(ps24[29], c24[29], ps23[30], pp25[29], c24[28]);
fa f2431(ps24[30], c24[30], ps23[31], pp25[30], c24[29]);
fa f2432(ps24[31], c24[31], c23[31], pp25[31], c24[30]);

fa f2507(ps25[6], c25[6], ps24[7], pp26[6], c255);
fa f2508(ps25[7], c25[7], ps24[8], pp26[7], c25[6]);
fa f2509(ps25[8], c25[8], ps24[9], pp26[8], c25[7]);
fa f2510(ps25[9], c25[9], ps24[10], pp26[9], c25[8]);
fa f2511(ps25[10], c25[10], ps24[11], pp26[10], c25[9]);
fa f2512(ps25[11], c25[11], ps24[12], pp26[11], c25[10]);
fa f2513(ps25[12], c25[12], ps24[13], pp26[12], c25[11]);
fa f2514(ps25[13], c25[13], ps24[14], pp26[13], c25[12]);
fa f2515(ps25[14], c25[14], ps24[15], pp26[14], c25[13]);
fa f2516(ps25[15], c25[15], ps24[16], pp26[15], c25[14]);
fa f2517(ps25[16], c25[16], ps24[17], pp26[16], c25[15]);
fa f2518(ps25[17], c25[17], ps24[18], pp26[17], c25[16]);
fa f2519(ps25[18], c25[18], ps24[19], pp26[18], c25[17]);
fa f2520(ps25[19], c25[19], ps24[20], pp26[19], c25[18]);
fa f2521(ps25[20], c25[20], ps24[21], pp26[20], c25[19]);
fa f2522(ps25[21], c25[21], ps24[22], pp26[21], c25[20]);
fa f2523(ps25[22], c25[22], ps24[23], pp26[22], c25[21]);
fa f2524(ps25[23], c25[23], ps24[24], pp26[23], c25[22]);
fa f2525(ps25[24], c25[24], ps24[25], pp26[24], c25[23]);
fa f2526(ps25[25], c25[25], ps24[26], pp26[25], c25[24]);
fa f2527(ps25[26], c25[26], ps24[27], pp26[26], c25[25]);
fa f2528(ps25[27], c25[27], ps24[28], pp26[27], c25[26]);
fa f2529(ps25[28], c25[28], ps24[29], pp26[28], c25[27]);
fa f2530(ps25[29], c25[29], ps24[30], pp26[29], c25[28]);
fa f2531(ps25[30], c25[30], ps24[31], pp26[30], c25[29]);
fa f2532(ps25[31], c25[31], c24[31], pp26[31], c25[30]);

fa f2606(ps26[5], c26[5], ps25[6], pp27[5], c264);
fa f2607(ps26[6], c26[6], ps25[7], pp27[6], c26[5]);
fa f2608(ps26[7], c26[7], ps25[8], pp27[7], c26[6]);
fa f2609(ps26[8], c26[8], ps25[9], pp27[8], c26[7]);
fa f2610(ps26[9], c26[9], ps25[10], pp27[9], c26[8]);
fa f2611(ps26[10], c26[10], ps25[11], pp27[10], c26[9]);
fa f2612(ps26[11], c26[11], ps25[12], pp27[11], c26[10]);
fa f2613(ps26[12], c26[12], ps25[13], pp27[12], c26[11]);
fa f2614(ps26[13], c26[13], ps25[14], pp27[13], c26[12]);
fa f2615(ps26[14], c26[14], ps25[15], pp27[14], c26[13]);
fa f2616(ps26[15], c26[15], ps25[16], pp27[15], c26[14]);
fa f2617(ps26[16], c26[16], ps25[17], pp27[16], c26[15]);
fa f2618(ps26[17], c26[17], ps25[18], pp27[17], c26[16]);
fa f2619(ps26[18], c26[18], ps25[19], pp27[18], c26[17]);
fa f2620(ps26[19], c26[19], ps25[20], pp27[19], c26[18]);
fa f2621(ps26[20], c26[20], ps25[21], pp27[20], c26[19]);
fa f2622(ps26[21], c26[21], ps25[22], pp27[21], c26[20]);
fa f2623(ps26[22], c26[22], ps25[23], pp27[22], c26[21]);
fa f2624(ps26[23], c26[23], ps25[24], pp27[23], c26[22]);
fa f2625(ps26[24], c26[24], ps25[25], pp27[24], c26[23]);
fa f2626(ps26[25], c26[25], ps25[26], pp27[25], c26[24]);
fa f2627(ps26[26], c26[26], ps25[27], pp27[26], c26[25]);
fa f2628(ps26[27], c26[27], ps25[28], pp27[27], c26[26]);
fa f2629(ps26[28], c26[28], ps25[29], pp27[28], c26[27]);
fa f2630(ps26[29], c26[29], ps25[30], pp27[29], c26[28]);
fa f2631(ps26[30], c26[30], ps25[31], pp27[30], c26[29]);
fa f2632(ps26[31], c26[31], c25[31], pp27[31], c26[30]);

fa f2705(ps27[4], c27[4], ps26[5], pp28[4], c273);
fa f2706(ps27[5], c27[5], ps26[6], pp28[5], c27[4]);
fa f2707(ps27[6], c27[6], ps26[7], pp28[6], c27[5]);
fa f2708(ps27[7], c27[7], ps26[8], pp28[7], c27[6]);
fa f2709(ps27[8], c27[8], ps26[9], pp28[8], c27[7]);
fa f2710(ps27[9], c27[9], ps26[10], pp28[9], c27[8]);
fa f2711(ps27[10], c27[10], ps26[11], pp28[10], c27[9]);
fa f2712(ps27[11], c27[11], ps26[12], pp28[11], c27[10]);
fa f2713(ps27[12], c27[12], ps26[13], pp28[12], c27[11]);
fa f2714(ps27[13], c27[13], ps26[14], pp28[13], c27[12]);
fa f2715(ps27[14], c27[14], ps26[15], pp28[14], c27[13]);
fa f2716(ps27[15], c27[15], ps26[16], pp28[15], c27[14]);
fa f2717(ps27[16], c27[16], ps26[17], pp28[16], c27[15]);
fa f2718(ps27[17], c27[17], ps26[18], pp28[17], c27[16]);
fa f2719(ps27[18], c27[18], ps26[19], pp28[18], c27[17]);
fa f2720(ps27[19], c27[19], ps26[20], pp28[19], c27[18]);
fa f2721(ps27[20], c27[20], ps26[21], pp28[20], c27[19]);
fa f2722(ps27[21], c27[21], ps26[22], pp28[21], c27[20]);
fa f2723(ps27[22], c27[22], ps26[23], pp28[22], c27[21]);
fa f2724(ps27[23], c27[23], ps26[24], pp28[23], c27[22]);
fa f2725(ps27[24], c27[24], ps26[25], pp28[24], c27[23]);
fa f2726(ps27[25], c27[25], ps26[26], pp28[25], c27[24]);
fa f2727(ps27[26], c27[26], ps26[27], pp28[26], c27[25]);
fa f2728(ps27[27], c27[27], ps26[28], pp28[27], c27[26]);
fa f2729(ps27[28], c27[28], ps26[29], pp28[28], c27[27]);
fa f2730(ps27[29], c27[29], ps26[30], pp28[29], c27[28]);
fa f2731(ps27[30], c27[30], ps26[31], pp28[30], c27[29]);
fa f2732(ps27[31], c27[31], c26[31], pp28[31], c27[30]);

fa f2804(ps28[3], c28[3], ps27[4], pp29[3], c282);
fa f2805(ps28[4], c28[4], ps27[5], pp29[4], c28[3]);
fa f2806(ps28[5], c28[5], ps27[6], pp29[5], c28[4]);
fa f2807(ps28[6], c28[6], ps27[7], pp29[6], c28[5]);
fa f2808(ps28[7], c28[7], ps27[8], pp29[7], c28[6]);
fa f2809(ps28[8], c28[8], ps27[9], pp29[8], c28[7]);
fa f2810(ps28[9], c28[9], ps27[10], pp29[9], c28[8]);
fa f2811(ps28[10], c28[10], ps27[11], pp29[10], c28[9]);
fa f2812(ps28[11], c28[11], ps27[12], pp29[11], c28[10]);
fa f2813(ps28[12], c28[12], ps27[13], pp29[12], c28[11]);
fa f2814(ps28[13], c28[13], ps27[14], pp29[13], c28[12]);
fa f2815(ps28[14], c28[14], ps27[15], pp29[14], c28[13]);
fa f2816(ps28[15], c28[15], ps27[16], pp29[15], c28[14]);
fa f2817(ps28[16], c28[16], ps27[17], pp29[16], c28[15]);
fa f2818(ps28[17], c28[17], ps27[18], pp29[17], c28[16]);
fa f2819(ps28[18], c28[18], ps27[19], pp29[18], c28[17]);
fa f2820(ps28[19], c28[19], ps27[20], pp29[19], c28[18]);
fa f2821(ps28[20], c28[20], ps27[21], pp29[20], c28[19]);
fa f2822(ps28[21], c28[21], ps27[22], pp29[21], c28[20]);
fa f2823(ps28[22], c28[22], ps27[23], pp29[22], c28[21]);
fa f2824(ps28[23], c28[23], ps27[24], pp29[23], c28[22]);
fa f2825(ps28[24], c28[24], ps27[25], pp29[24], c28[23]);
fa f2826(ps28[25], c28[25], ps27[26], pp29[25], c28[24]);
fa f2827(ps28[26], c28[26], ps27[27], pp29[26], c28[25]);
fa f2828(ps28[27], c28[27], ps27[28], pp29[27], c28[26]);
fa f2829(ps28[28], c28[28], ps27[29], pp29[28], c28[27]);
fa f2830(ps28[29], c28[29], ps27[30], pp29[29], c28[28]);
fa f2831(ps28[30], c28[30], ps27[31], pp29[30], c28[29]);
fa f2832(ps28[31], c28[31], c27[31], pp29[31], c28[30]);

fa f2903(ps29[2], c29[2], ps28[3], pp30[2], c291);
fa f2904(ps29[3], c29[3], ps28[4], pp30[3], c29[2]);
fa f2905(ps29[4], c29[4], ps28[5], pp30[4], c29[3]);
fa f2906(ps29[5], c29[5], ps28[6], pp30[5], c29[4]);
fa f2907(ps29[6], c29[6], ps28[7], pp30[6], c29[5]);
fa f2908(ps29[7], c29[7], ps28[8], pp30[7], c29[6]);
fa f2909(ps29[8], c29[8], ps28[9], pp30[8], c29[7]);
fa f2910(ps29[9], c29[9], ps28[10], pp30[9], c29[8]);
fa f2911(ps29[10], c29[10], ps28[11], pp30[10], c29[9]);
fa f2912(ps29[11], c29[11], ps28[12], pp30[11], c29[10]);
fa f2913(ps29[12], c29[12], ps28[13], pp30[12], c29[11]);
fa f2914(ps29[13], c29[13], ps28[14], pp30[13], c29[12]);
fa f2915(ps29[14], c29[14], ps28[15], pp30[14], c29[13]);
fa f2916(ps29[15], c29[15], ps28[16], pp30[15], c29[14]);
fa f2917(ps29[16], c29[16], ps28[17], pp30[16], c29[15]);
fa f2918(ps29[17], c29[17], ps28[18], pp30[17], c29[16]);
fa f2919(ps29[18], c29[18], ps28[19], pp30[18], c29[17]);
fa f2920(ps29[19], c29[19], ps28[20], pp30[19], c29[18]);
fa f2921(ps29[20], c29[20], ps28[21], pp30[20], c29[19]);
fa f2922(ps29[21], c29[21], ps28[22], pp30[21], c29[20]);
fa f2923(ps29[22], c29[22], ps28[23], pp30[22], c29[21]);
fa f2924(ps29[23], c29[23], ps28[24], pp30[23], c29[22]);
fa f2925(ps29[24], c29[24], ps28[25], pp30[24], c29[23]);
fa f2926(ps29[25], c29[25], ps28[26], pp30[25], c29[24]);
fa f2927(ps29[26], c29[26], ps28[27], pp30[26], c29[25]);
fa f2928(ps29[27], c29[27], ps28[28], pp30[27], c29[26]);
fa f2929(ps29[28], c29[28], ps28[29], pp30[28], c29[27]);
fa f2930(ps29[29], c29[29], ps28[30], pp30[29], c29[28]);
fa f2931(ps29[30], c29[30], ps28[31], pp30[30], c29[29]);
fa f2932(ps29[31], c29[31], c28[31], pp30[31], c29[30]);

fa f3002(ps30[1], c30[1], ps29[2], pp31[1], c300);
fa f3003(ps30[2], c30[2], ps29[3], pp31[2], c30[1]);
fa f3004(ps30[3], c30[3], ps29[4], pp31[3], c30[2]);
fa f3005(ps30[4], c30[4], ps29[5], pp31[4], c30[3]);
fa f3006(ps30[5], c30[5], ps29[6], pp31[5], c30[4]);
fa f3007(ps30[6], c30[6], ps29[7], pp31[6], c30[5]);
fa f3008(ps30[7], c30[7], ps29[8], pp31[7], c30[6]);
fa f3009(ps30[8], c30[8], ps29[9], pp31[8], c30[7]);
fa f3010(ps30[9], c30[9], ps29[10], pp31[9], c30[8]);
fa f3011(ps30[10], c30[10], ps29[11], pp31[10], c30[9]);
fa f3012(ps30[11], c30[11], ps29[12], pp31[11], c30[10]);
fa f3013(ps30[12], c30[12], ps29[13], pp31[12], c30[11]);
fa f3014(ps30[13], c30[13], ps29[14], pp31[13], c30[12]);
fa f3015(ps30[14], c30[14], ps29[15], pp31[14], c30[13]);
fa f3016(ps30[15], c30[15], ps29[16], pp31[15], c30[14]);
fa f3017(ps30[16], c30[16], ps29[17], pp31[16], c30[15]);
fa f3018(ps30[17], c30[17], ps29[18], pp31[17], c30[16]);
fa f3019(ps30[18], c30[18], ps29[19], pp31[18], c30[17]);
fa f3020(ps30[19], c30[19], ps29[20], pp31[19], c30[18]);
fa f3021(ps30[20], c30[20], ps29[21], pp31[20], c30[19]);
fa f3022(ps30[21], c30[21], ps29[22], pp31[21], c30[20]);
fa f3023(ps30[22], c30[22], ps29[23], pp31[22], c30[21]);
fa f3024(ps30[23], c30[23], ps29[24], pp31[23], c30[22]);
fa f3025(ps30[24], c30[24], ps29[25], pp31[24], c30[23]);
fa f3026(ps30[25], c30[25], ps29[26], pp31[25], c30[24]);
fa f3027(ps30[26], c30[26], ps29[27], pp31[26], c30[25]);
fa f3028(ps30[27], c30[27], ps29[28], pp31[27], c30[26]);
fa f3029(ps30[28], c30[28], ps29[29], pp31[28], c30[27]);
fa f3030(ps30[29], c30[29], ps29[30], pp31[29], c30[28]);
fa f3031(ps30[30], c30[30], ps29[31], pp31[30], c30[29]);
fa f3032(ps30[31], c30[31], c29[31], pp31[31], c30[30]);

assign msb={c30[31], ps30[31], ps30[30], ps30[29], ps30[28], ps30[27], ps30[26],ps30[25], ps30[24], ps30[23], ps30[22], ps30[21], ps30[20], ps30[19], ps30[18], ps30[17], ps30[16], ps30[15], ps30[14],ps30[13], ps30[12], ps30[11], ps30[10], ps30[9], ps30[8], ps30[7],ps30[6], ps30[5], ps30[4], ps30[3], ps30[2], ps30[1]}; 
endmodule


// ALU MODULE
module alu(aluout,a,b,opsel,outsel,clk,over);
//Output variables
	output [31:0] aluout;
        output over;
	
//Input variables
	input [31:0] a,b;
	input [1:0] opsel;
	input [2:0] outsel;
	input clk;
	reg [31:0] aluout;
//Wire
	
	wire [31:0] OUT_LOGIC, OUT_ADD_SUB, OUT_MUL_MSB, OUT_MUL_LSB, OUT_COMP;
	wire out_c;
	wire f1, f0;
	
//Calling 32 bit adder, logic, and multiplication and comparator module
	logic_fn l1(OUT_LOGIC,a,b,opsel);
	as32b l2(OUT_ADD_SUB, out_c, over, a, b, opsel);
	mul l3(OUT_MUL_MSB,OUT_MUL_LSB,a,b,clk);
	tree_comp l4(a,b,f1,f0);
	assign OUT_COMP = {30'b0, f1, f0};
	
//Case loop
	always @(OUT_LOGIC or OUT_ADD_SUB or OUT_MUL_MSB or OUT_MUL_LSB or OUT_COMP or outsel[2] or outsel[1] or outsel[0])
	case ({outsel[2],outsel[1],outsel[0]})
	3'b000 : aluout = OUT_LOGIC;
	3'b001 : aluout = OUT_ADD_SUB;
	3'b010 : aluout = OUT_MUL_LSB;
	3'b011 : aluout = OUT_MUL_MSB;
	3'b100 : aluout = OUT_COMP;
	default : $display("Please check Select Lines!");
	endcase
        endmodule

//output

module OutPut(outPut, oen, out);
input oen;
input [31:0] out;
output [31:0] outPut;
wire [31:0] outPut;

tristate_32 tr(out, oen, outPut);
endmodule


// ALU operand
 module ALUoperand(a, b, clk, A, B);

 input clk;
 input [31:0] a,b;
 output [31:0] A, B;
 //wire [31:0] A, B;
 dreg_32bit aa(a, clk, A);
 dreg_32bit bb(b, clk, B);

 endmodule


//write back address
module writeBackAddr(addressB, clk, addrB);
input [4:0] addressB;
input clk;
output [4:0] addrB;
//wire [4:0] addrB;

dreg_5bit bd(addressB, clk, addrB);

 endmodule

//ALU operation
module ALUoperation(opsel, outsel, oen, clk, OPSEL, OUTSEL, OEN);

input clk,oen;
input [1:0] opsel;
input [2:0] outsel;
output [1:0] OPSEL;
output [2:0] OUTSEL;
output OEN;

dreg_2bit ops(opsel, clk, OPSEL);
dreg_3bit outs(outsel, clk, OUTSEL);
dreg oe(oen, clk, OEN);

endmodule

////////////////////////////////////////////////////////////////////////////////
//									      //
// Students should fill out the following modules to add Comparator in the ALU//
//									      //
// Please check the "//write your code here" part in the source               //
//									      //
////////////////////////////////////////////////////////////////////////////////

//one bit comparator
module one_bit_comp(a, b, f1, f0);
input a, b;
output f1, f0;

//if (a > b) then {f1, f0} = 2'b01
//if (a < b) then {f1, f0} = 2'b00
//if (a == b) then {f1, f0} = 2'b10

//write your code here

endmodule

//mux to select the f1 f0 outputs
module mux_4to2(hi_f1, hi_f0, lo_f1, lo_f0, f1, f0);

input hi_f1, hi_f0, lo_f1, lo_f0;
output f1, f0;

//use hi_f1 to select the correct outputs

//write your code here

endmodule

//32-bit tree comparator
module tree_comp(A, B, f1, f0);
input [31 : 0] A, B;
output f1, f0;

wire [31 : 0] f1_L5, f0_L5;
wire [15 : 0] f1_L4, f0_L4;
wire [7 : 0] f1_L3, f0_L3;
wire [3 : 0] f1_L2, f0_L2;
wire [1 : 0] f1_L1, f0_L1;

//write your code here

//Level 5: 32 one_bit_comp go here

//Level 4: 16 mux_4to2 go here

//Level 3: 8 mux_4to2 go here

//Level 2: 4 mux_4to2 go here

//Level 1: 2 mux_4to2 go here

//Level 0: 1 mux_4to2 goes here

endmodule


//////cpu//////////////////

module cpu(addressA, addressB, dataIn, asel,bsel, clk, opsel, outsel, oen, outPut, over);
input [31:0] dataIn;
input [4:0] addressA, addressB;
input [1:0] opsel;
input [2:0] outsel;
input oen, clk, asel, bsel;

output [31:0] outPut;
output over;

wire [1:0] OPSEL;
wire [2:0] OUTSEL; 
wire  OEN;
wire [4:0] backB;
wire [31:0] aluout,A,B,outPut;
wire [31:0] outA, outB;


writeBackAddr wb(addressB,clk, backB);
memoryBlock mb(addressA, addressB, backB, aluout, dataIn, asel, bsel,clk,outA, outB);

ALUoperand mOpd(outA, outB, clk, A, B);
ALUoperation mmOpn(opsel, outsel, oen, clk, OPSEL, OUTSEL, OEN);
alu a(aluout,A,B,OPSEL, OUTSEL, clk, over);
OutPut o(outPut, OEN, aluout);

endmodule



