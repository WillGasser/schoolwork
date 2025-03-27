vcom -93 work/dlx_types.vhd
vcom -93 work/bva.vhd
vcom -93 work/bva-b.vhd
vcom -93 ALU.vhd


vsim -t ns work.alu

# waves
add wave -divider "Inputs"
add wave -radix hexadecimal /alu/operand1
add wave -radix hexadecimal /alu/operand2
add wave -radix unsigned /alu/operation
add wave -divider "Outputs"
add wave -radix hexadecimal /alu/result
add wave -radix binary /alu/error

# Test unsigned add (0000): normal case
echo "Test: Unsigned Addition - Normal Case"
force -freeze /alu/operand1 32'h0000000A 0
force -freeze /alu/operand2 32'h00000014 0
force -freeze /alu/operation 4'h0 0
run 20 ns

# Test unsigned add (0000): overflow case
echo "Test: Unsigned Addition - Overflow Case"
force -freeze /alu/operand1 32'hFFFFFFFF 0
force -freeze /alu/operand2 32'h00000001 0
force -freeze /alu/operation 4'h0 0
run 20 ns

# Test unsigned subtract (0001): normal case
echo "Test: Unsigned Subtraction - Normal Case"
force -freeze /alu/operand1 32'h0000001E 0
force -freeze /alu/operand2 32'h0000000F 0
force -freeze /alu/operation 4'h1 0
run 20 ns

# Test unsigned subtract (0001): underflow case
echo "Test: Unsigned Subtraction - Underflow Case"
force -freeze /alu/operand1 32'h0000000F 0
force -freeze /alu/operand2 32'h0000001E 0
force -freeze /alu/operation 4'h1 0
run 20 ns

# Test two's complement add (0010): normal case
echo "Test: Two's Complement Addition - Normal Case"
force -freeze /alu/operand1 32'h00000064 0
force -freeze /alu/operand2 32'hFFFFFFCE 0
force -freeze /alu/operation 4'h2 0
run 20 ns

# Test two's complement add (0010): overflow case
echo "Test: Two's Complement Addition - Overflow Case"
force -freeze /alu/operand1 32'h7FFFFFFF 0
force -freeze /alu/operand2 32'h00000001 0
force -freeze /alu/operation 4'h2 0
run 20 ns

# Test two's complement subtract (0011): normal case
echo "Test: Two's Complement Subtraction - Normal Case"
force -freeze /alu/operand1 32'h00000032 0
force -freeze /alu/operand2 32'h00000019 0
force -freeze /alu/operation 4'h3 0
run 20 ns

# Test two's complement multiply (0100): normal case
echo "Test: Two's Complement Multiply - Normal Case"
force -freeze /alu/operand1 32'h00000005 0
force -freeze /alu/operand2 32'hFFFFFFFD 0
force -freeze /alu/operation 4'h4 0
run 20 ns

# Test two's complement divide (0101): normal case
echo "Test: Two's Complement Divide - Normal Case"
force -freeze /alu/operand1 32'h0000000A 0
force -freeze /alu/operand2 32'h00000002 0
force -freeze /alu/operation 4'h5 0
run 20 ns

# Test two's complement divide (0101): divide by zero
echo "Test: Two's Complement Divide - Divide by Zero"
force -freeze /alu/operand1 32'h0000000A 0
force -freeze /alu/operand2 32'h00000000 0
force -freeze /alu/operation 4'h5 0
run 20 ns

# Test bitwise AND (0111)
echo "Test: Bitwise AND"
force -freeze /alu/operand1 32'h0000000C 0
force -freeze /alu/operand2 32'h0000000A 0
force -freeze /alu/operation 4'h7 0
run 20 ns

# Test bitwise OR (1001)
echo "Test: Bitwise OR"
force -freeze /alu/operand1 32'h0000000C 0
force -freeze /alu/operand2 32'h0000000A 0
force -freeze /alu/operation 4'h9 0
run 20 ns

# Test logical NOT (1010)
echo "Test: Logical NOT"
force -freeze /alu/operand1 32'h0000000C 0
force -freeze /alu/operand2 32'h00000000 0
force -freeze /alu/operation 4'hA 0
run 20 ns

# Test bitwise NOT (1011)
echo "Test: Bitwise NOT"
force -freeze /alu/operand1 32'h0000000C 0
force -freeze /alu/operand2 32'h00000000 0
force -freeze /alu/operation 4'hB 0
run 20 ns

# Test pass operand1 (1100)
echo "Test: Pass Operand1"
force -freeze /alu/operand1 32'h0001E240 0
force -freeze /alu/operand2 32'h00000000 0
force -freeze /alu/operation 4'hC 0
run 20 ns

# Test pass operand2 (1101)
echo "Test: Pass Operand2"
force -freeze /alu/operand1 32'h00000000 0
force -freeze /alu/operand2 32'h0001E240 0
force -freeze /alu/operation 4'hD 0
run 20 ns

# Test output all zeros (1110)
echo "Test: Output All Zeros"
force -freeze /alu/operand1 32'h0000000C 0
force -freeze /alu/operand2 32'h00000022 0
force -freeze /alu/operation 4'hE 0
run 20 ns

# Test output all ones (1111)
echo "Test: Output All Ones"
force -freeze /alu/operand1 32'h0000000C 0
force -freeze /alu/operand2 32'h00000022 0
force -freeze /alu/operation 4'hF 0
run 20 ns

echo "ALU test completed"