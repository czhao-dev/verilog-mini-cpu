/*
Description: Control Unit for a simple mini CPU
This module interprets the opcode and generates control signals for the ALU.
It maps the opcode directly to ALU operation codes in this simple design.
*/


module control_unit (
    input wire [2:0] opcode,
    output wire [2:0] alu_op
);

    // In this simple system, opcode maps directly to ALU operation
    assign alu_op = opcode;
endmodule
