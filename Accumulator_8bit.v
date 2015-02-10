module EightBitAdder(A, B, SUM, CO);
  
	input  [7:0] A;  
	input  [7:0] B;  
	output [7:0] SUM;  
	output CO;  
	wire [8:0] tmp; 
 	assign tmp = A + B;  
	assign SUM = tmp [7:0];  
	assign CO  = tmp [8];  
endmodule

module Accumulator_8bit(clock, accumulate, clear, in1, accum_out, overflow);

	input clock;
	input accumulate;
	input clear;
	input [7:0] in1;
	output [7:0] accum_out;
	output overflow;
	
	reg [7:0] accum_out;
	wire [7:0] accum_in;
	wire carry;
	wire overflow;
	wire enable;
	wire [7:0] result;
	
	EightBitAdder u1(in1,accum_out,result,overflow);
	assign enable = accumulate || clear;
	assign accum_in = (clear==1) ? 8'b0 : result;
	
	always@(posedge clock)
		if (enable)
			accum_out <= accum_in;
endmodule 