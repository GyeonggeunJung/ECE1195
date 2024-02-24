# ECE1195
University of Pittsburgh ADVANCED DIGITAL DESIGN 2024 Spring

## Content
1. [Lab 1: Full Adder](#lab-1-full-adder)
2. [Lab 2: Arithmetic Logic Unit (ALU) Design](#lab-2-arithmetical-logic-unit-alu-design)
## Lab 1: Full Adder
<p align="center"><img width="436" alt="image" src="https://github.com/GyeonggeunJung/ECE1195/assets/113646015/0619b2fb-ca25-43f3-b257-fa425ac6324c"></p>

- Design a generic 32 bit adder/subtractor using generic statement and for-generate statement. 
- Write a testbench to fully test VHDL design, verify the functionality using the behavioral simulation.

## Lab 2: Arithmetic Logic Unit (ALU) Design
<p align="center"><img width="653" alt="image" src="https://github.com/GyeonggeunJung/ECE1195/assets/113646015/737c3bd9-b6ea-49c5-bb08-d56301d86e09"></p>

- Design the ALU, per the diagram shown in the picture above.
- Create the top level ALU using structural-architecture VHDL code.
- Write a VHDL testbench to verify the functionality of the ALU, at least test each ALU operation once.
- Synthesize, Implement and Generate Bitstream for ALU, then write C/C++ testbench to fully verify the functionality of FPGA-configured design.

## Lab 3: Hardware Multiplier Design
<p align="center"><img width="355" alt="image" src="https://github.com/GyeonggeunJung/ECE1195/assets/113646015/544fb6eb-65fc-4a58-bdfb-d67e851731b8"></p>

- Design the 32-bit Multiplier Unit, per the hardware algorithm above. Final top-level Multiplier Unit should have the following IO ports.
- Write a VHDL or Tcl Script testbench to verify the functionality of the Multiplier Unit, should test a wide range of cases.
- Synthesize, implement and generate bitstream for your Multiplier Unit, then write C/C++ testbench to fully verify the functionality of your FPGA-configured design. You should test a wide range of cases and include random testing. You will be needing more regmap registers for this lab, so make sure to configure and take notes of their numbers and bit-widths.
