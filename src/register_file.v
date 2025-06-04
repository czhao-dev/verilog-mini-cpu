/*
Description: Register File for a simple mini CPU
This module implements a simple register file with two registers (A and B).
It allows writing to the registers and outputs their current values.
The write operation is controlled by a write enable signal.
The register file is reset to zero on a reset signal.
The write operation writes the same data to both registers, with register B being incremented by 1.
*/

module register_file (
    input wire clk,
    input wire reset,
    input wire write_enable,
    input wire [3:0] write_data,
    output reg [3:0] reg_a,
    output reg [3:0] reg_b,
);
    reg [3:0] A, B;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A <= 4'b0000;
            B <= 4'b0000;
        end else if (write_enable) begin
            A <= write_data; // Write to register A
            B <= write_data + 1; // Write to register B
        end
    end

    always @(*) begin
        reg_a = A; // Output current value of register A
        reg_b = B; // Output current value of register B
    end

endmodule
