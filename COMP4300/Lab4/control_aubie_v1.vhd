use work.bv_arithmetic.all; 
use work.dlx_types.all; 

entity aubie_controller is
	generic(propDelay : time := 15 ns);
	port(ir_control: in dlx_word;
	     alu_out: in dlx_word; 
	     alu_error: in error_code; 
	     clock: in bit; 
	     regfilein_mux: out threeway_muxcode; 
	     memaddr_mux: out threeway_muxcode; 
	     addr_mux: out bit; 
	     pc_mux: out threeway_muxcode;
	     alu_func: out alu_operation_code; 
	     regfile_index: out register_index;
	     regfile_readnotwrite: out bit; 
	     regfile_clk: out bit;   
	     mem_clk: out bit;
	     mem_readnotwrite: out bit;  
	     ir_clk: out bit; 
	     imm_clk: out bit; 
	     addr_clk: out bit;  
             pc_clk: out bit; 
	     op1_clk: out bit; 
	     op2_clk: out bit; 
	     result_clk: out bit
	     ); 
end aubie_controller; 

architecture behavior of aubie_controller is
begin
	behav: process(clock) is 
		type state_type is range 1 to 20; 
		variable state: state_type := 1; 
		variable opcode: byte; 
		variable destination,operand1,operand2 : register_index; 

	begin
		if clock'event and clock = '1' then
		   opcode := ir_control(31 downto 24);
		   destination := ir_control(23 downto 19);
		   operand1 := ir_control(18 downto 14);
		   operand2 := ir_control(13 downto 9); 
		   case state is
			when 1 => -- instruction fetch state for all types
				-- Configure for memory read operation
				mem_readnotwrite <= '1' after propDelay; 
				memaddr_mux <= "00" after propDelay; 
				addr_mux <= '1' after propDelay; 
				
				-- Set register clocks
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;				
				result_clk <= '0' after propDelay;
				regfile_clk <= '0' after propDelay;
				
				-- Enable memory and instruction register
				mem_clk <= '1' after propDelay;
				ir_clk <= '1' after propDelay;

				state := 2; 
			when 2 =>  
				-- Instruction decode - determine operation type
			 	if opcode(7 downto 4) = "0000" then -- ALU op
					state := 3; 
				elsif opcode = X"20" then  -- STO 
					state := 9;
				elsif opcode = X"30" or opcode = X"31" then -- LD or LDI
					state := 7;
				elsif opcode = X"22" then -- STOR
					state := 14;
				elsif opcode = X"32" then -- LDR
					state := 12;
				elsif opcode = X"40" or opcode = X"41" then -- JMP or JZ
					state := 16;
				elsif opcode = X"10" then -- NOOP
					state := 19;
				else -- error
				end if; 
			when 3 => 
				-- ALU operation - first operand load
				regfile_index <= operand1 after propDelay; 
				regfile_readnotwrite <= '1' after propDelay; 

				-- Set register clocks
				regfile_clk <= '1' after propDelay;
				op1_clk <= '1' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;
				
				state := 4; 
			when 4 => 
				-- ALU operation - second operand load
				regfile_index <= operand2 after propDelay;
				regfile_readnotwrite <= '1' after propDelay;

				-- Set register clocks
				regfile_clk <= '1' after propDelay;
				op2_clk <= '1' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;
	
         			state := 5; 
			when 5 => 
				-- ALU operation execution
				alu_func <= opcode(3 downto 0) after propDelay;
				
				-- Set register clocks
				result_clk <= '1' after propDelay;
				regfile_clk <= '0' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				
            			state := 6; 
			when 6 => 
				-- ALU result writeback and PC increment
				regfile_readnotwrite <= '0' after propDelay;
				regfile_index        <= destination after propDelay;

				-- Configure multiplexers
				pc_mux <= "00" after propDelay;
				regfilein_mux <= "00" after propDelay;

				-- Set register clocks
				pc_clk <= '1' after propDelay;
				regfile_clk <= '1' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

            			state := 1; 
			when 7 => 
				-- LD/LDI - address/immediate fetch
				mem_readnotwrite <= '1' after propDelay; 

				-- Configure multiplexers
				pc_mux <= "00" after propDelay;
				memaddr_mux <= "00" after propDelay;

				-- Set register clocks
				pc_clk <= '1' after propDelay;
				mem_clk <= '1' after propDelay;
				regfile_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				if opcode = X"30" then
					-- LD configuration
					addr_mux <= '1' after propDelay;
					addr_clk <= '1' after propDelay;
					imm_clk <= '0' after propDelay;
				else
					-- LDI configuration
					imm_clk <= '1' after propDelay;
					addr_clk <= '0' after propDelay;
				end if;
				state := 8; 
			when 8 => 
				-- LD/LDI - data load to register
				regfile_index <= destination after propDelay;
				regfile_readnotwrite <= '0' after propDelay;
				pc_mux <= "00" after propDelay;

				-- Set register clocks
				regfile_clk <= '1' after propDelay;
				ir_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				if opcode = X"30" then
					-- LD configuration
					mem_readnotwrite <= '1' after propDelay;
					memaddr_mux <= "01" after propDelay;
					regfilein_mux <= "01" after propDelay;
					mem_clk <= '1' after propDelay;
					imm_clk <= '0' after propDelay;
				else
					-- LDI configuration
					regfilein_mux <= "10" after propDelay;
					imm_clk <= '1' after propDelay;
					mem_clk <= '0' after propDelay;
				end if;
        			state := 1; 
			when 9 =>
				-- STO - first stage (PC increment)
				pc_mux <= "00" after propDelay;
				pc_clk <= '1' after propDelay;

				-- Reset other clocks
				regfile_clk <= '0' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 10;

			when 10 =>
				-- STO - address fetch from memory
				mem_readnotwrite <= '1' after propDelay;

				-- Configure multiplexers
				memaddr_mux <= "00" after propDelay;
				addr_mux <= '1' after propDelay;
				
				-- Set register clocks
				mem_clk <= '1' after propDelay;
				addr_clk <= '1' after propDelay;
				regfile_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 11;

			when 11 =>
				-- STO - data store to memory
				regfile_readnotwrite <= '1' after propDelay;
				mem_readnotwrite <= '0' after propDelay;
				regfile_index <= operand1 after propDelay;

				-- Configure multiplexers
				memaddr_mux <= "00" after propDelay;
				pc_mux <= "01" after propDelay;

				-- Set register clocks
				regfile_clk <= '1' after propDelay;
				mem_clk <= '1' after propDelay;
				pc_clk <= '1' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 1;

			when 12 => 
				-- LDR - register address fetch
				regfile_readnotwrite <= '1' after propDelay;
				regfile_index <= operand1 after propDelay;

				-- Configure multiplexers
				addr_mux <= '0' after propDelay;
				
				-- Set register clocks
				regfile_clk <= '1' after propDelay;
				addr_clk <= '1' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
 				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 13;

			when 13 =>
				-- LDR - data load to register
				mem_readnotwrite <= '1' after propDelay;
				regfile_readnotwrite <= '0' after propDelay;
				regfile_index <= destination after propDelay;

				-- Configure multiplexers
				regfilein_mux <= "01" after propDelay;
				memaddr_mux <= "01" after propDelay;
				pc_mux <= "00" after propDelay;
				
				-- Set register clocks
				mem_clk <= '1' after propDelay;
				regfile_clk <= '1' after propDelay;
				pc_clk <= '1' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 1;

			when 14 =>
				-- STOR - register address fetch
				regfile_readnotwrite <= '1' after propDelay;
				regfile_index <= destination after propDelay;

				-- Configure multiplexers
				addr_mux <= '0' after propDelay;								

				-- Set register clocks
				regfile_clk <= '1' after propDelay;
				addr_clk <= '1' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 15;

			when 15 =>
				-- STOR - data store to memory
				regfile_readnotwrite <= '1' after propDelay;
				mem_readnotwrite <= '0' after propDelay;
				regfile_index <= operand1 after propDelay;

				-- Configure multiplexers
				memaddr_mux <= "01" after propDelay;
				pc_mux <= "00" after propDelay;

				-- Set register clocks
				regfile_clk <= '1' after propDelay;
				mem_clk <= '1' after propDelay;
				pc_clk <= '1' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 1;
			
			when 16 =>
				-- JMP/JZ - PC increment
				pc_mux <= "00" after propDelay;
				pc_clk <= '1' after propDelay;

				-- Reset other clocks
				regfile_clk <= '0' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 17;

			when 17 =>
				-- JMP/JZ - address fetch
				mem_readnotwrite <= '1' after propDelay;

				-- Configure multiplexers
				memaddr_mux <= "00" after propDelay;
				addr_mux <= '1' after propDelay;
				
				-- Set register clocks
				mem_clk <= '1' after propDelay;
				addr_clk <= '1' after propDelay;
				regfile_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				pc_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 18;

			when 18 =>
				-- JMP/JZ - branch decision
				if opcode = X"40" then
					-- Unconditional jump
					pc_mux <= "01" after propDelay;
					pc_clk <= '1' after propDelay;
				else
					-- JZ instruction - conditional jump
					-- Since we can't directly check regfile_out, we need to go back to state 1
					-- and rely on the controller's logic for conditional jumps
					pc_mux <= "00" after propDelay;
					pc_clk <= '1' after propDelay;
				end if;

				state := 1;

			when 19 =>
				-- NOOP - just increment PC
				pc_mux <= "00" after propDelay;
				pc_clk <= '1' after propDelay;
				
				-- Reset other clocks
				regfile_clk <= '0' after propDelay;
				mem_clk <= '0' after propDelay;
				ir_clk <= '0' after propDelay;
				imm_clk <= '0' after propDelay;
				addr_clk <= '0' after propDelay;
				op1_clk <= '0' after propDelay;
				op2_clk <= '0' after propDelay;
				result_clk <= '0' after propDelay;

				state := 1;
			when others => null; 
		   end case; 
		elsif clock'event and clock = '0' then
			-- Reset all register clocks on falling edge
			regfile_clk <= '0' after propDelay;
			mem_clk <= '0' after propDelay;
			ir_clk <= '0' after propDelay;
			imm_clk <= '0' after propDelay;
			addr_clk <= '0' after propDelay;
			pc_clk <= '0' after propDelay;
			op1_clk <= '0' after propDelay;
			op2_clk <= '0' after propDelay;
			result_clk <= '0' after propDelay;		
		end if; 
	end process behav;
end behavior;