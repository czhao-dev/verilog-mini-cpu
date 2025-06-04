/*
Description: ALU for a simple mini CPU
This module implements a simple Arithmetic Logic Unit (ALU) that can perform
basic arithmetic and logical operations on 4-bit inputs.
The operations include addition, subtraction, bitwise AND, OR, XOR, NOT,
and bit shifts.
*/


module alu (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire [2:0] op,
    output reg [3:0] result,
    output wire zero
);

    always @(*) begin
        case (op)
            3'b000: result = a + b; // ADD
            3'b001: result = a - b; // SUB
            3'b010: result = a & b; // AND
            3'b011: result = a | b; // OR
            3'b100: result = a ^ b; // XOR
            3'b101: result = ~a;    // NOT
            3'b110: result = a << 1; // SHIFT LEFT
            3'b111: result = a >> 1; // SHIFT RIGHT
            default: result = 4'b0000; // Default case
        endcase
    end

    assign zero = (result == 4'b0000); // Zero flag

endmodule
