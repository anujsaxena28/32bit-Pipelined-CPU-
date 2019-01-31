module stimulus;

parameter T = 20;

reg [31:0] dataIn;
reg [1:0] opsel, outsel;
reg [4:0] addressA, addressB;
reg asel, bsel, oen, clk;

wire [31:0] outPut;
wire over;


integer handle3,desc3;

// Instantiate the design block counter
cpu proj(addressA, addressB, dataIn, asel,bsel, clk, opsel, outsel, oen, outPut, over);
initial
begin
clk = 1'b1;
forever #T  clk = ~clk;
end

initial
 begin
handle3 = $fopen ("stim_proj.out");
  $shm_open("shm.db",1);
  $shm_probe(stimulus,"AS");
  #500  $shm_close();
  #1 $finish;
  end


always
begin
desc3=handle3;
#1 $fdisplay(desc3, $time,"clk=%b, addressA=%d, addressB=%d, dataIn=%d, opsel=%d, outsel=%d, asel=%d, bsel=%d, oen=%d, OUT=%d", clk, addressA, addressB, dataIn, opsel, outsel,asel, bsel, oen, outPut);

end

 // Stimulate the Input Signals
initial
 begin

// 1. store (-10) in [0]

#T

addressA = 5'b00000;

addressB = 5'b00000;

dataIn = 32'hFFFF_FFF6;

opsel = 2'b01;

outsel =2'b00;

asel = 0;

bsel = 0;

oen = 1;


#(T*2)


// 2. store 10 in [1]

addressA=5'b00000;

addressB= 5'b00001;

dataIn = 32'hA;

opsel = 2'b01;

outsel = 2'b00;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)

// 3. store 30 in [2]

addressA = 5'b00000;

addressB = 5'b00010;

dataIn = 32'h1E;


opsel = 2'b01;

outsel =2'b00;

asel = 0;

bsel = 0;

oen = 1;



#(T*2)

// 4. store 50 in [20]

addressA = 5'b00000;

addressB = 5'b10100;

dataIn = 32'h32;

opsel = 2'b01;

outsel =2'b00;

asel = 0;

bsel = 0;

oen = 1;

#(T*2)

//5. ADD     [0][1]  FFFF_FFF6 + 0000_000A = 0

addressA = 5'd0;

addressB = 5'd1;

dataIn = 32'd0;

opsel = 2'b00;

outsel =2'b01;

asel = 1;

bsel = 1;

oen = 1;


#(T*2)

#(T*2)

//6. ADD      [1][2] = 0 + 1E = 1E	
addressA = 5'd1;

addressB = 5'd2;

dataIn = 32'd0;

opsel = 2'b00;

outsel =2'b01;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)

//7. SUB      [0][20] = FFFF_FFF6 - 0000_0032 = FFFF_FFC4
addressA = 5'd0;

addressB = 5'd20;

dataIn = 32'd0;

opsel = 2'b01;

outsel =2'b01;

asel = 1;

bsel = 1;

oen = 1;

#(T*2)

//8. READ     [1] = 0
addressA = 5'd1;

addressB = 5'd1;

dataIn = 32'd0;

opsel = 2'b01;

outsel =2'b00;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)

//9. READ     [2] = 1E
addressA = 5'd2;

addressB = 5'd2;

dataIn = 32'd0;

opsel = 2'b01;

outsel =2'b00;

asel = 1;

bsel = 0;

oen = 1;

#(T*2)

//10. READ     [20] = FFFF_FFC4
addressA = 5'd20;

addressB = 5'd20;

dataIn = 32'd0;

opsel = 2'b01;

outsel =2'b00;

asel = 1;

bsel = 0;

oen = 1;

end
endmodule
