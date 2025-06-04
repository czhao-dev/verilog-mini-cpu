/*
Description: Testbench for the top module of a simple Verilog CPU
This testbench simulates the top module of a simple mini CPU, which includes
a register file, control unit, and ALU. It tests various ALU operations by
writing data to the registers and applying different opcodes.
*/


`timescale 1ns / 1ps

module top_tb;
    reg clk;
    reg reset;
    reg write_enable;
    reg [3:0] write_data;
    reg [2:0] opcode;
    wire [3:0] result;
    wire zero;

    // Instantiate the top module
    top uut (
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .write_data(write_data),
        .opcode(opcode),
        .result(result),
        .zero(zero)
    );

    // Clock generation
    always #5 clk = ~clk; // 10 ns clock period

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, top_tb);

        reset = 1; write_enable = 0; opcode = 0; write_data = 0;
        #10 reset = 0;

        write_enable = 1; write_data = 4; #10; // Load A=4, B=5
        write_enable = 0;

        opcode = 3'b000; #10; // ADD
        $display("ADD Result: %b, Zero: %b", result, zero);
        if (result !== 9 || zero !== 0) $display("Error in ADD operation");

        opcode = 3'b001; #10; // SUB
        $display("SUB Result: %b, Zero: %b", result, zero);
        if (result !== 4 || zero !== 0) $display("Error in SUB operation");

        opcode = 3'b010; #10; // AND
        $display("AND Result: %b, Zero: %b", result, zero);
        if (result !== 4 || zero !== 0) $display("Error in AND operation");

        opcode = 3'b011; #10; // OR
        $display("OR Result: %b, Zero: %b", result, zero);
        if (result !== 5 || zero !== 0) $display("Error in OR operation");

        opcode = 3'b100; #10; // XOR
        $display("XOR Result: %b, Zero: %b", result, zero);
        if (result !== 1 || zero !== 0) $display("Error in XOR operation");

        opcode = 3'b101; #10; // NOT
        $display("NOT Result: %b, Zero: %b", result, zero);
        if (result !== 11 || zero !== 0) $display("Error in NOT operation");

        opcode = 3'b110; #10; // SHIFT LEFT
        $display("SHIFT LEFT Result: %b, Zero: %b", result, zero);
        if (result !== 8 || zero !== 0) $display("Error in SHIFT LEFT operation");

        opcode = 3'b111; #10; // SHIFT RIGHT
        $display("SHIFT RIGHT Result: %b, Zero: %b", result, zero);
        if (result !== 2 || zero !== 0) $display("Error in SHIFT RIGHT operation");
    
        $finish;
    end
endmodule
