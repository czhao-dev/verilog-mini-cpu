# Mini 4-bit ALU-Based CPU in Verilog

This is a modular Verilog hardware design project that implements a simplified, CPU-like system using a 4-bit Arithmetic Logic Unit (ALU), a two-register register file, and a control unit. It's designed to be easy to simulate, understand, and extend — making it a great educational tool and portfolio piece.


## System Overview

This system mimics the basic structure of a tiny processor. It performs ALU operations based on instructions provided via an `opcode`, using data stored in two 4-bit registers.

### Key Modules

| Module          | Description |
|-----------------|-------------|
| `alu.v`         | Performs arithmetic and logic operations like ADD, SUB, AND, OR, XOR, shifts, and SLT. |
| `register_file.v` | Contains two 4-bit registers (A and B) for source operands. |
| `control_unit.v` | Decodes the 3-bit `opcode` and maps it to the appropriate ALU operation. |
| `top.v`         | Top-level module connecting all components into a working datapath. |
| `top_tb.v`      | Testbench to simulate the complete design and visualize behavior with waveform tools. |


## Supported ALU Operations

| Opcode | Operation     | Description              |
|--------|---------------|--------------------------|
| `000`  | ADD           | Adds A and B             |
| `001`  | SUB           | Subtracts B from A       |
| `010`  | AND           | Bitwise AND              |
| `011`  | OR            | Bitwise OR               |
| `100`  | XOR           | Bitwise XOR              |
| `101`  | SLL           | Logical left shift (A)   |
| `110`  | SRL           | Logical right shift (A)  |
| `111`  | SLT           | Set Less Than (A < B)    |


## Project Structure

```
.
├── src/
│   ├── alu.v
│   ├── control_unit.v
│   ├── register_file.v
│   ├── top.v
├── tb/
│   └── top_tb.v
├── README.md
└── Makefile
```

## Simulation Instructions

### Prerequisites

Make sure the following tools are installed:

- [Icarus Verilog](http://iverilog.icarus.com/) — for compiling Verilog code
- [GTKWave](http://gtkwave.sourceforge.net/) — for viewing simulation waveforms

### Run Simulation

```bash
make
```
### Demo

```bash
gtkwave waveform.vcd
```

## License

This project is open-source under the MIT License. Feel free to use, modify, and share.

## Contributing

Pull requests are welcome! If you find bugs or have suggestions for improvement, feel free to open an issue or fork the repository.

## Author

GitHub: @czhao-dev
