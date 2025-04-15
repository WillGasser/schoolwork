proc pause {} {
    puts "\nPress Enter to continue..."
    gets stdin dummy
}

#--------------------------------------------------------------------
# Test Aubie Processor
echo "\nTesting Aubie Processor"
vsim -t ns work.aubie

# Add clock and control signals
add wave -divider "Clock and Control"
add wave -radix binary /aubie/aubie_clock
add wave -decimal /aubie/aubie_ctl/state
add wave -radix hexadecimal /aubie/aubie_ctl/opcode
add wave -radix binary /aubie/aubie_ctl/destination
add wave -radix binary /aubie/aubie_ctl/operand1
add wave -radix binary /aubie/aubie_ctl/operand2

# Add memory signals
add wave -divider "Memory Signals"
add wave -radix binary /aubie/mem_clk
add wave -radix binary /aubie/mem_readnotwrite
add wave -radix hexadecimal /aubie/memaddr_in
add wave -radix hexadecimal /aubie/mem_out

# Add PC and IR signals
add wave -divider "PC and Instruction"
add wave -radix binary /aubie/pc_clk
add wave -radix binary /aubie/pc_mux
add wave -radix hexadecimal /aubie/pc_out
add wave -radix hexadecimal /aubie/pcplusone_out
add wave -radix binary /aubie/ir_clk
add wave -radix hexadecimal /aubie/ir_out

# Add register file signals
add wave -divider "Register File"
add wave -radix binary /aubie/regfile_clk
add wave -radix binary /aubie/regfile_readnotwrite
add wave -radix binary /aubie/regfile_index
add wave -radix hexadecimal /aubie/regfile_in
add wave -radix hexadecimal /aubie/regfile_out

# Add register file contents (all registers)
add wave -divider "Register File Contents"
add wave -radix hexadecimal /aubie/aubie_regfile/registers

# Add memory contents (interesting locations)
add wave -divider "Memory Contents"
add wave -radix hexadecimal /aubie/aubie_memory/mem_behav/data_memory(0)
add wave -radix hexadecimal /aubie/aubie_memory/mem_behav/data_memory(1)
add wave -radix hexadecimal /aubie/aubie_memory/mem_behav/data_memory(2)
add wave -radix hexadecimal /aubie/aubie_memory/mem_behav/data_memory(256)

# Setup clock (200ns period as required in lab)
echo "Setting up 200ns period clock and running simulation..."
force -freeze /aubie/aubie_clock 0 0, 1 {100 ns} -r 200

# Execute enough cycles to see fetch cycle
run 200 ns
pause

# Execute enough cycles to complete first instruction (LD R4, 0x100)
echo "Running to complete first instruction cycle..."
run 800 ns
pause

# Continue running to see more execution
echo "Continuing execution..."
run 1000 ns

# Zoom to see the full simulation
wave zoom full