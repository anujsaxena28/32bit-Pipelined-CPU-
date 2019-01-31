# 32bit-Pipelined-CPU-
32-bit Pipelined CPU design with New ALU Architecture

This primary objective of this project is to understand the 32-bit pipelined CPU by means of a standard cell based ASIC Design Flow. The design provided describes the 32-bit pipelined CPU which has a 32-bit word length and can perform multiple instructions simultaneously. When we talk about a pipelined architecture the critical path delays and the synchronisation of the circuit has large significance and should be dealt with carefully. The CPU comprises of 2 major blocks:
1)	ALU
2)	Memory File 

The project contains two case studies. The first one deals with the implementation of the ALU along with various adder designs within the 32-bit CPU. The structural Verilog design is simulated and verified against a test bench at each abstraction level of the ASIC design flow. The second case study adds a comparator block to the ALU design and the 32-bit CPU design is simulated and verified at each abstraction level of the ASIC design flow.   

The ASIC design flow comprises of RTL simulation, Logic Synthesis using Synopsys Design Compiler, Place and Route using Cadence Encounter and finally equivalence checking and layout printing. The first step involves RTL simulation of the Verilog design against a test bench which helps in verifying the design operations. The logic synthesis maps the Verilog code to a circuit which comprises of standard cell. Place and route provides the necessary details of the routing (interconnect) and the placement of these cells specified in a GSDII format file. The circuit is verified at each step for any violations. 


The repository consists of Verilog files for the 32-bit CPU Design with the following adder styles and a 32-bit comparator.   
1) Carry Lookahead Adder
2) Ripple Carry Adder
3) Carry Save Adder 
4) Carry Select Adder
5) Comparator

The repository also comprises of a Verilog Testbench used to verify the design.
