all: 
	iverilog -o cpu_test src/*.v tb/top_tb.v
	vvp cpu_test
