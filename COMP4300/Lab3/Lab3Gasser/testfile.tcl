vcom -93 work/dlx_types.vhd
vcom -93 work/bva.vhd
vcom -93 work/bva-b.vhd

vcom -93 dlx_register.vhd
vcom -93 reg_file.vhd
vcom -93 mux.vhd
vcom -93 threeway_mux.vhd
vcom -93 increment.vhd

# Utility procedure to pause for screenshot capture.
proc pause {} {
    puts "\nPress Enter to continue..."
    gets stdin dummy
}

#--------------------------------------------------------------------
# Test dlx_register
echo "\nTesting dlx_register"
vsim -t ns work.dlx_register
add wave -divider "dlx_register - Inputs" 
add wave -radix hexadecimal /dlx_register/in_val
add wave -radix binary /dlx_register/clock
add wave -divider "dlx_register - Output"
add wave -radix hexadecimal /dlx_register/out_val

echo "Test dlx_register: Load value when clock is high"
force -freeze /dlx_register/in_val X"DEADBEEF" 0
force -freeze /dlx_register/clock 1 0
run 20 ns
pause

echo "Test dlx_register: With clock low, input change should not affect output"
force -freeze /dlx_register/clock 0 0
force -freeze /dlx_register/in_val X"CAFEBABE" 0
run 20 ns
pause

echo "Test dlx_register: Load new value when clock is high again"
force -freeze /dlx_register/clock 1 0
force -freeze /dlx_register/in_val X"12345678" 0
run 20 ns
pause

#--------------------------------------------------------------------
# Test reg_file
echo "\nTesting reg_file"
vsim -t ns work.reg_file
add wave -divider "reg_file - Inputs"
add wave -radix hexadecimal /reg_file/data_in
add wave -radix binary /reg_file/readnotwrite
add wave -radix binary /reg_file/clock
add wave -radix binary /reg_file/reg_number
add wave -divider "reg_file - Output"
add wave -radix hexadecimal /reg_file/data_out

echo "Test reg_file: Write a value then read it (register 3)"
# Write to register 3
force -freeze /reg_file/clock 1 0
force -freeze /reg_file/readnotwrite 0 0
force -freeze /reg_file/data_in X"DEADBEEF" 0
force -freeze /reg_file/reg_number "00011" 0
run 20 ns
pause

# Read from register 3
force -freeze /reg_file/clock 1 0
force -freeze /reg_file/readnotwrite 1 0
force -freeze /reg_file/reg_number "00011" 0
run 20 ns
pause

#--------------------------------------------------------------------
# Test two-way multiplexer (mux)
echo "\nTesting two-way mux"
vsim -t ns work.mux
add wave -divider "mux - Inputs"
add wave -radix hexadecimal /mux/input_0
add wave -radix hexadecimal /mux/input_1
add wave -radix binary /mux/which
add wave -divider "mux - Output"
add wave -radix hexadecimal /mux/output

echo "Test mux: Select input_0"
force -freeze /mux/input_0 X"11111111" 0
force -freeze /mux/input_1 X"22222222" 0
force -freeze /mux/which 0 0
run 10 ns
pause

echo "Test mux: Select input_1"
force -freeze /mux/which 1 0
run 10 ns
pause

#--------------------------------------------------------------------
# Test three-way multiplexer (threeway_mux)
echo "\nTesting three-way mux"
vsim -t ns work.threeway_mux
add wave -divider "threeway_mux - Inputs"
add wave -radix hexadecimal /threeway_mux/input_0
add wave -radix hexadecimal /threeway_mux/input_1
add wave -radix hexadecimal /threeway_mux/input_2
add wave -radix binary /threeway_mux/which
add wave -divider "threeway_mux - Output"
add wave -radix hexadecimal /threeway_mux/output

echo "Test threeway_mux: Select input_0 (code 00)"
force -freeze /threeway_mux/input_0 X"AAAAAAAA" 0
force -freeze /threeway_mux/input_1 X"BBBBBBBB" 0
force -freeze /threeway_mux/input_2 X"CCCCCCCC" 0
force -freeze /threeway_mux/which "00" 0
run 10 ns
pause

echo "Test threeway_mux: Select input_1 (code 01)"
force -freeze /threeway_mux/which "01" 0
run 10 ns
pause

echo "Test threeway_mux: Select input_2 (code 10)"
force -freeze /threeway_mux/which "10" 0
run 10 ns
pause

echo "Test threeway_mux: Invalid select code (11, defaults to input_0)"
force -freeze /threeway_mux/which "11" 0
run 10 ns
pause

#--------------------------------------------------------------------
# Test pcplusone (increment)
echo "\nTesting pcplusone (increment)"
vsim -t ns work.pcplusone
add wave -divider "pcplusone - Inputs"
add wave -radix hexadecimal /pcplusone/input
add wave -radix binary /pcplusone/clock
add wave -divider "pcplusone - Outputs"
add wave -radix hexadecimal /pcplusone/output
add wave -radix hexadecimal /pcplusone/current_pc

echo "Test pcplusone: Increment from zero"
force -freeze /pcplusone/input X"00000000" 0
force -freeze /pcplusone/clock 1 0
run 10 ns
pause

echo "Test pcplusone: Increment from one"
force -freeze /pcplusone/input X"00000001" 0
force -freeze /pcplusone/clock 1 0
run 10 ns
pause