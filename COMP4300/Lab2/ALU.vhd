library ieee;
use ieee.std_logic_1164.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity alu is
    port(
        operand1, operand2: in dlx_word; 
        operation: in alu_operation_code;
        result: out dlx_word; 
        error: out error_code
    );
end entity alu;

architecture behavioral of alu is
begin
    alu_process: process(operand1, operand2, operation)
        variable temp_result: dlx_word;
        variable temp_error: error_code;
        variable overflow_flag: boolean;
        variable div_by_zero_flag: boolean;
        variable zero: dlx_word := (others => '0');
        variable ones: dlx_word := (others => '1');
    begin
        temp_error := "0000";
        
        case operation is
            when "0000" =>
                bv_addu(operand1, operand2, temp_result, overflow_flag);
                if overflow_flag then
                    temp_error := "0001";
                end if;
                
            when "0001" =>
                bv_subu(operand1, operand2, temp_result, overflow_flag);
                if overflow_flag then
                    temp_error := "0001";
                end if;
                
            when "0010" =>
                bv_add(operand1, operand2, temp_result, overflow_flag);
                if overflow_flag then
                    temp_error := "0001";
                end if;
                
            when "0011" =>
                bv_sub(operand1, operand2, temp_result, overflow_flag);
                if overflow_flag then
                    temp_error := "0001";
                end if;
                
            when "0100" =>
                bv_mult(operand1, operand2, temp_result, overflow_flag);
                if overflow_flag then
                    temp_error := "0001";
                end if;
                
            when "0101" =>
                if operand2 = zero then
                    temp_error := "0010";
                    temp_result := zero;
                else
                    bv_div(operand1, operand2, temp_result, div_by_zero_flag, overflow_flag);
                    if div_by_zero_flag then
                        temp_error := "0010";
                    elsif overflow_flag then
                        temp_error := "0001";
                    end if;
                end if;
                
            when "0111" =>
                temp_result := operand1 and operand2;
                
            when "1001" =>
                temp_result := operand1 or operand2;
                
            when "1010" =>
                temp_result := not operand1;
                
            when "1011" =>
                temp_result := not operand1;
                
            when "1100" =>
                temp_result := operand1;
                
            when "1101" =>
                temp_result := operand2;
                
            when "1110" =>
                temp_result := zero;
                
            when "1111" =>
                temp_result := ones;
                
            when others =>
                temp_result := zero;
                temp_error := "0000";
        end case;
        
        result <= temp_result after 15 ns;
        error <= temp_error after 15 ns;
    end process alu_process;
end architecture behavioral;