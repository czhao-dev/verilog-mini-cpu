/*
Description: Top module for a simple mini CPU
This module integrates the ALU, register file, and control unit to form a simple mini CPU.
It handles the clock, reset, and write operations, and outputs the result of ALU operations.
It also includes a zero flag to indicate if the result is zero.
*/


module top (
    input wire clk,
    input wire reset,
    input wire write_enable,
    input wire [3:0] write_data,
    input wire [2:0] opcode,
    output wire [3:0] result,
    output wire zero
);
    wire [3:0] a, b;
    wire [2:0] alu_op;

    register_file rf (
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .write_data(write_data),
        .reg_a(a),
        .reg_b(b)
    );

    control_unit cu (
        .opcode(opcode),
        .alu_op(alu_op)
    );

    alu alu_inst (
        .a(a),
        .b(b),
        .op(alu_op),
        .result(result),
        .zero(zero)
    );
endmodule
