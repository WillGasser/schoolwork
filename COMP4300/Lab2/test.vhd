library ieee;
use ieee.std_logic_1164.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity alu_test is
end entity alu_test;
architecture test of alu_test is
    component alu is
        port(
            operand1, operand2: in dlx_word;
            operation: in alu_operation_code;
            result: out dlx_word;
            error: out error_code
        );
    end component;
    
    signal op1, op2: dlx_word;
    signal result: dlx_word;
    signal operation: alu_operation_code;
    signal error: error_code;
    
begin
    UUT: alu port map(
        operand1 => op1,
        operand2 => op2,
        operation => operation,
        result => result,
        error => error
    );
    
    test_proc: process
    begin
        -- Test unsigned add (0000): normal case
        report "Test: Unsigned Addition - Normal Case";
        op1 <= integer_to_bv(10, 32);
        op2 <= integer_to_bv(20, 32);
        operation <= "0000";
        wait for 20 ns;
        
        -- Test unsigned add (0000): overflow case
        report "Test: Unsigned Addition - Overflow Case";
        op1 <= (others => '1'); -- Maximum value
        op2 <= integer_to_bv(1, 32);
        operation <= "0000";
        wait for 20 ns;
        
        -- Test unsigned subtract (0001): normal case
        report "Test: Unsigned Subtraction - Normal Case";
        op1 <= integer_to_bv(30, 32);
        op2 <= integer_to_bv(15, 32);
        operation <= "0001";
        wait for 20 ns;
        
        -- Test unsigned subtract (0001): underflow case
        report "Test: Unsigned Subtraction - Underflow Case";
        op1 <= integer_to_bv(15, 32);
        op2 <= integer_to_bv(30, 32);
        operation <= "0001";
        wait for 20 ns;
        
        -- Test two's complement add (0010): normal case
        report "Test: Two's Complement Addition - Normal Case";
        op1 <= integer_to_bv(100, 32);
        op2 <= integer_to_bv(-50, 32);
        operation <= "0010";
        wait for 20 ns;
        
        -- Test two's complement add (0010): overflow case
        report "Test: Two's Complement Addition - Overflow Case";
        op1 <= integer_to_bv(2147483647, 32); -- INT_MAX
        op2 <= integer_to_bv(1, 32);
        operation <= "0010";
        wait for 20 ns;
        
        -- Test two's complement subtract (0011): normal case
        report "Test: Two's Complement Subtraction - Normal Case";
        op1 <= integer_to_bv(50, 32);
        op2 <= integer_to_bv(25, 32);
        operation <= "0011";
        wait for 20 ns;
        
        -- Test two's complement multiply (0100): normal case
        report "Test: Two's Complement Multiply - Normal Case";
        op1 <= integer_to_bv(5, 32);
        op2 <= integer_to_bv(-3, 32);
        operation <= "0100";
        wait for 20 ns;
        
        -- Test two's complement divide (0101): normal case
        report "Test: Two's Complement Divide - Normal Case";
        op1 <= integer_to_bv(10, 32);
        op2 <= integer_to_bv(2, 32);
        operation <= "0101";
        wait for 20 ns;
        
        -- Test two's complement divide (0101): divide by zero
        report "Test: Two's Complement Divide - Divide by Zero";
        op1 <= integer_to_bv(10, 32);
        op2 <= (others => '0');  -- Zero
        operation <= "0101";
        wait for 20 ns;
        
        -- Test bitwise AND (0111)
        report "Test: Bitwise AND";
        op1 <= integer_to_bv(12, 32);  -- 0x0000000C (binary: 1100)
        op2 <= integer_to_bv(10, 32);  -- 0x0000000A (binary: 1010)
        operation <= "0111";
        wait for 20 ns;
        
        -- Test bitwise OR (1001)
        report "Test: Bitwise OR";
        op1 <= integer_to_bv(12, 32);  -- 0x0000000C (binary: 1100)
        op2 <= integer_to_bv(10, 32);  -- 0x0000000A (binary: 1010)
        operation <= "1001";
        wait for 20 ns;
        
        -- Test logical NOT (1010)
        report "Test: Logical NOT";
        op1 <= integer_to_bv(12, 32);  -- 0x0000000C
        op2 <= (others => '0');  -- Doesn't matter
        operation <= "1010";
        wait for 20 ns;
        
        -- Test bitwise NOT (1011)
        report "Test: Bitwise NOT";
        op1 <= integer_to_bv(12, 32);  -- 0x0000000C
        op2 <= (others => '0');  -- Doesn't matter
        operation <= "1011";
        wait for 20 ns;
        
        -- Test pass operand1 (1100)
        report "Test: Pass Operand1";
        op1 <= integer_to_bv(123456, 32);
        op2 <= (others => '0');  -- Doesn't matter
        operation <= "1100";
        wait for 20 ns;
        
        -- Test pass operand2 (1101)
        report "Test: Pass Operand2";
        op1 <= (others => '0');  -- Doesn't matter
        op2 <= integer_to_bv(123456, 32);
        operation <= "1101";
        wait for 20 ns;
        
        -- Test output all zeros (1110)
        report "Test: Output All Zeros";
        op1 <= integer_to_bv(12, 32);  -- Doesn't matter
        op2 <= integer_to_bv(34, 32);  -- Doesn't matter
        operation <= "1110";
        wait for 20 ns;
        
        -- Test output all ones (1111)
        report "Test: Output All Ones";
        op1 <= integer_to_bv(12, 32);  -- Doesn't matter
        op2 <= integer_to_bv(34, 32);  -- Doesn't matter
        operation <= "1111";
        wait for 20 ns;
        
        report "ALU test completed";
        wait;
    end process test_proc;
end architecture test;
