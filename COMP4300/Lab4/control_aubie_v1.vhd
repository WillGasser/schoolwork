
use work.bv_arithmetic.all; 
use work.dlx_types.all; 

entity aubie_controller is
	port(ir_control: in dlx_word;
	     alu_out: in dlx_word; 
	     alu_error: in error_code; 
	     clock: in bit; 
	     regfilein_mux: out threeway_muxcode; 
	     memaddr_mux: out threeway_muxcode; 
	     addr_mux: out bit; 
	     pc_mux: out bit; 
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
			when 1 => -- fetch the instruction, for all types
				-- PC → memory address, read instruction, load IR, increment PC
				memaddr_mux <= "00"; -- Select PC as memory address source
				mem_readnotwrite <= '1'; -- Set memory to read mode
				ir_clk <= '1'; -- Enable instruction register
				pc_mux <= '0'; -- Select PC+1 for next PC value
				pc_clk <= '1'; -- Update PC
				state := 2; 
			when 2 =>  
				
				-- figure out which instruction
			 	if opcode(7 downto 4) = "0000" then -- ALU op
					state := 3; 
				elsif opcode = X"20" then  -- STO 
					state := 9; -- State for STO instructions
				elsif opcode = X"30" or opcode = X"31" then -- LD or LDI
					state := 7;
				elsif opcode = X"22" then -- STOR
					state := 11; -- State for STOR instructions
				elsif opcode = X"32" then -- LDR
					state := 13; -- State for LDR instructions
				elsif opcode = X"40" or opcode = X"41" then -- JMP or JZ
					state := 15; -- State for jump instructions
				elsif opcode = X"10" then -- NOOP
					state := 1; -- Just go back to fetch for NOOP
				else -- error
					state := 1; -- Go back to fetch on error
				end if; 
			when 3 => 
				-- ALU op:  load op1 register from the regfile
				regfile_index <= operand1; -- Select operand1 register
				regfile_readnotwrite <= '1'; -- Set regfile to read mode
				regfile_clk <= '1'; -- Enable register file
				op1_clk <= '1'; -- Store value in op1 register
				state := 4; 
			when 4 => 
				-- ALU op: load op2 register from the regfile 
				regfile_index <= operand2; -- Select operand2 register
				regfile_readnotwrite <= '1'; -- Set regfile to read mode
				regfile_clk <= '1'; -- Enable register file
				op2_clk <= '1'; -- Store value in op2 register
         	state := 5; 
			when 5 => 
				-- ALU op: perform ALU operation
				-- Set ALU function based on opcode
				alu_func <= opcode(3 downto 0); -- Lower 4 bits determine operation
				result_clk <= '1'; -- Store ALU result
            state := 6; 
			when 6 => 
				-- ALU op: write back ALU operation
				regfilein_mux <= "00"; -- Select ALU result
				regfile_index <= destination; -- Select destination register
				regfile_readnotwrite <= '0'; -- Set regfile to write mode
				regfile_clk <= '1'; -- Enable register file
            state := 1; -- Return to fetch
			when 7 => 
				-- LD or LDI: get the addr or immediate word
				memaddr_mux <= "00"; -- Select PC as memory address source
				mem_readnotwrite <= '1'; -- Set memory to read mode
				
				if opcode = X"30" then -- LD instruction
					addr_mux <= '1'; -- Select memory output for address
					addr_clk <= '1'; -- Store the address
				elsif opcode = X"31" then -- LDI instruction
					imm_clk <= '1'; -- Store the immediate value
				end if;
				
				pc_mux <= '0'; -- Select PC+1 for next PC value
				pc_clk <= '1'; -- Update PC
				state := 8; 
			when 8 => 
				-- LD or LDI
				if opcode = X"30" then -- LD instruction
					memaddr_mux <= "01"; -- Select addr_out as memory address
					mem_readnotwrite <= '1'; -- Set memory to read mode
					mem_clk <= '1'; -- Enable memory read
					regfilein_mux <= "01"; -- Select memory output for regfile
				elsif opcode = X"31" then -- LDI instruction
					regfilein_mux <= "10"; -- Select immediate value for regfile
				end if;
				
				regfile_index <= destination; -- Select destination register
				regfile_readnotwrite <= '0'; -- Set regfile to write mode
				regfile_clk <= '1'; -- Enable register write
        		state := 1; -- Return to fetch
			when 9 => 
				-- STO: get the address word
				memaddr_mux <= "00"; -- Select PC as memory address source
				mem_readnotwrite <= '1'; -- Set memory to read mode
				addr_mux <= '1'; -- Select memory output for address
				addr_clk <= '1'; -- Store the address
				pc_mux <= '0'; -- Select PC+1 for next PC value
				pc_clk <= '1'; -- Update PC
				state := 10;
				
			when 10 => 
				-- STO: store the value
				regfile_index <= operand1; -- Select operand1 register
				regfile_readnotwrite <= '1'; -- Set regfile to read mode
				regfile_clk <= '1'; -- Enable register read
				op1_clk <= '1'; -- Store value in op1 register
				state := 18;
				
			when 11 => 
				-- STOR: load the register containing address
				regfile_index <= destination; -- Select destination register (contains address)
				regfile_readnotwrite <= '1'; -- Set regfile to read mode
				regfile_clk <= '1'; -- Enable register read
				addr_mux <= '0'; -- Select regfile output for address
				addr_clk <= '1'; -- Store the address
				state := 12;
				
			when 12 => 
				-- STOR: load the value to store and store it
				regfile_index <= operand1; -- Select operand1 register (contains value)
				regfile_readnotwrite <= '1'; -- Set regfile to read mode
				regfile_clk <= '1'; -- Enable register read
				op1_clk <= '1'; -- Store value in op1 register
				state := 18;
				
			when 13 => 
				-- LDR: load the register containing address
				regfile_index <= operand1; -- Select operand1 register (contains address)
				regfile_readnotwrite <= '1'; -- Set regfile to read mode
				regfile_clk <= '1'; -- Enable register read
				addr_mux <= '0'; -- Select regfile output for address
				addr_clk <= '1'; -- Store the address
				state := 14;
				
			when 14 => 
				-- LDR: load the value from memory into destination register
				memaddr_mux <= "01"; -- Select addr_out as memory address
				mem_readnotwrite <= '1'; -- Set memory to read mode
				mem_clk <= '1'; -- Enable memory read
				regfilein_mux <= "01"; -- Select memory output for regfile
				regfile_index <= destination; -- Select destination register
				regfile_readnotwrite <= '0'; -- Set regfile to write mode
				regfile_clk <= '1'; -- Enable register write
				state := 1; -- Return to fetch
				
			when 15 => 
				-- JMP/JZ: get the address word
				memaddr_mux <= "00"; -- Select PC as memory address source
				mem_readnotwrite <= '1'; -- Set memory to read mode
				addr_mux <= '1'; -- Select memory output for address
				addr_clk <= '1'; -- Store the address
				pc_mux <= '0'; -- Select PC+1 for next PC value
				pc_clk <= '1'; -- Update PC
				
				if opcode = X"40" then -- JMP instruction (unconditional)
					state := 17; -- Skip checking condition
				elsif opcode = X"41" then -- JZ instruction (conditional)
					state := 16; -- Check condition
				end if;
				
			when 16 => 
				-- JZ: check if operand1 is zero
				regfile_index <= operand1; -- Select operand1 register
				regfile_readnotwrite <= '1'; -- Set regfile to read mode
				regfile_clk <= '1'; -- Enable register read
				op1_clk <= '1'; -- Store value in op1 register
				state := 17;
				
			when 17 => 
				-- JMP/JZ: update PC if jumping
				if opcode = X"40" then -- JMP (unconditional)
					pc_mux <= '1'; -- Select addr_out for next PC value
					pc_clk <= '1'; -- Update PC
				elsif opcode = X"41" and op1_out = X"00000000" then -- JZ and condition is true
					pc_mux <= '1'; -- Select addr_out for next PC value
					pc_clk <= '1'; -- Update PC
				end if;
				state := 1; -- Return to fetch
				
			when 18 => 
				-- Common state for STO and STOR operations
				memaddr_mux <= "01"; -- Select addr_out as memory address
				mem_readnotwrite <= '0'; -- Set memory to write mode
				mem_clk <= '1'; -- Enable memory write
				state := 1; -- Return to fetch
				
			when others => null; 
		   end case; 
		elsif clock'event and clock = '0' then
			-- reset all the register clocks
			ir_clk <= '0';
			imm_clk <= '0';
			addr_clk <= '0';
			pc_clk <= '0';
			op1_clk <= '0';
			op2_clk <= '0';
			result_clk <= '0';
			regfile_clk <= '0';
			mem_clk <= '0';
		end if; 
	end process behav;
end behavior;
