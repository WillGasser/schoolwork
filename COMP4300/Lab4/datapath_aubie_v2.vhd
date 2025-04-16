-- datapath_aubie.vhd
-- Fixing tab formatting for process/begin sections

-- entity reg_file implementation
use work.dlx_types.all; 
use work.bv_arithmetic.all;  

entity reg_file is
     generic(prop_delay: time := 10 ns);
     port (data_in: in dlx_word; readnotwrite,clock : in bit; 
	   data_out: out dlx_word; reg_number: in register_index );
end entity reg_file; 

architecture behavior of reg_file is
begin
	regFileProcess: process(data_in, readnotwrite, clock, reg_number) is
		type reg_type is array (0 to 31) of dlx_word;

		variable registers: reg_type;
		begin
			if clock = '1' then
				if readnotwrite = '1' then
					data_out <= registers(bv_to_integer(reg_number)) after prop_delay;
				else
					registers(bv_to_integer(reg_number)) := data_in;
				end if;
			end if;
	end process regFileProcess;
end architecture behavior;


-- entity alu implementation
use work.dlx_types.all; 
use work.bv_arithmetic.all; 

entity alu is 
     generic(prop_delay : Time := 5 ns);
     port(operand1, operand2: in dlx_word; operation: in alu_operation_code; 
          result: out dlx_word; error: out error_code); 
end entity alu; 

architecture behavior of alu is
begin
	aluProcess: process(operand1, operand2, operation) is
		variable opResult: dlx_word;
		variable remainder: dlx_word;

		variable divByZero: boolean := false;
		variable ovfl: boolean := false;

		variable error_val: error_code := "0000";

		begin
			-- Initialize error code to zero (no errors)
			error_val := "0000";

			-- Unsigned Add operation
			if operation = "0000" then
				bv_addu(operand1, operand2, opResult, ovfl);
				if ovfl then
					error_val := "0001";
				end if;

			-- Unsigned Subtract operation
			elsif operation = "0001" then
				bv_subu(operand1, operand2, opResult, ovfl);
				if ovfl then
					error_val := "0010";
				end if;
		
			-- Two's Complement Add operation
			elsif operation = "0010" then
				bv_add(operand1, operand2, opResult, ovfl);
				if ovfl then
					if operand1(31) = '0' and operand2(31) = '0' and opResult(31) = '1' then
						error_val := "0001";
					elsif operand1(31) = '1' and operand2(31) = '1' and opResult(31) = '0' then
						error_val := "0010";
					end if;
				end if;

			-- Two's Complement Subtract operation
			elsif operation = "0011" then
				bv_sub(operand1, operand2, opResult, ovfl);
				if ovfl then
					if operand1(31) = '0' and operand2(31) = '1' and opResult(31) = '1' then
						error_val := "0001";
					elsif operand1(31) = '1' and operand2(31) = '0' and opResult(31) = '0' then
						error_val := "0010";
					end if;
				end if;

			-- Two's Complement Multiply operation
			elsif operation = "0100" then
				bv_multu(operand1, operand2, opResult, ovfl);
				if ovfl then
					if (operand1(31) = '0' and operand2(31) = '1') or (operand1(31) = '1' and operand2(31) = '0') then
						error_val := "0010";
					else
						error_val := "0001";
					end if;
				end if;

			-- Two's Complement Divide operation
			elsif operation = "0101" then
				bv_divu(operand1, operand2, opResult, remainder, divByZero);
				if divByZero then
					error_val := "0011";
				end if;

			-- Logical AND operation
			elsif operation = "0110" then
				if operand1 = "00000000000000000000000000000000" or operand2 = "00000000000000000000000000000000" then
					opResult := "00000000000000000000000000000000";
				else
					opResult := "00000000000000000000000000000001";
				end if;

			-- Bitwise AND operation
			elsif operation = "0111" then
				opResult := operand1 and operand2;

			-- Logical OR operation
			elsif operation = "1000" then
				if operand1 = "00000000000000000000000000000000" and operand2 = "00000000000000000000000000000000" then
					opResult := "00000000000000000000000000000000";
				else 
					opResult := "00000000000000000000000000000001";
				end if;

			-- Bitwise OR operation
			elsif operation = "1001" then
				opResult := operand1 or operand2;

			-- Logical NOT of operand1
			elsif operation = "1010" then
				if operand1 = "00000000000000000000000000000000" then
					opResult := "00000000000000000000000000000001";
				else
					opResult := "00000000000000000000000000000000";
				end if;

			-- Bitwise NOT of operand1
			elsif operation = "1011" then
				opResult := not operand1;

			-- Default case: output all zeros
			else
				opResult := "00000000000000000000000000000000";
			end if;
			
			-- Output results
			result <= opResult after prop_delay;
			error <= error_val after prop_delay;
	end process aluProcess;
end architecture behavior;

-- alu_operation_code values:
-- 0000 unsigned add
-- 0001 unsigned sub
-- 0010 2's compl add
-- 0011 2's compl sub
-- 0100 2's compl mul
-- 0101 2's compl divide
-- 0110 logical and
-- 0111 bitwise and
-- 1000 logical or
-- 1001 bitwise or
-- 1010 logical not (op1) 
-- 1011 bitwise not (op1)
-- 1100-1111 output all zeros

-- error code values:
-- 0000 = no error
-- 0001 = overflow (too large positive) 
-- 0010 = underflow (too small negative) 
-- 0011 = divide by zero 

-- entity dlx_register implementation
use work.dlx_types.all; 

entity dlx_register is
     generic(prop_delay : Time := 5 ns);
     port(in_val: in dlx_word; clock: in bit; out_val: out dlx_word);
end entity dlx_register;

architecture behavior of dlx_register is
begin
	dlxRegProcess: process(in_val, clock) is
	begin
		if clock = '1' then
			out_val <= in_val after prop_delay;
		end if;
	end process dlxRegProcess;
end architecture behavior;

-- entity pcplusone implementation
use work.dlx_types.all;
use work.bv_arithmetic.all; 

entity pcplusone is
	generic(prop_delay: Time := 5 ns); 
	port (input: in dlx_word; clock: in bit; output: out dlx_word); 
end entity pcplusone; 

architecture behavior of pcplusone is 
begin
	plusone: process(input,clock) is
		variable newpc: dlx_word;
		variable error: boolean; 
	begin
	   if clock'event and clock = '1' then
	  	bv_addu(input,"00000000000000000000000000000001",newpc,error);
		output <= newpc after prop_delay; 
	   end if; 
	end process plusone; 
end architecture behavior; 

-- entity mux implementation
use work.dlx_types.all; 

entity mux is
     generic(prop_delay : Time := 5 ns);
     port (input_1,input_0 : in dlx_word; which: in bit; output: out dlx_word);
end entity mux;

architecture behavior of mux is
begin
   muxProcess : process(input_1, input_0, which) is
   begin
      if (which = '1') then
         output <= input_1 after prop_delay;
      else
         output <= input_0 after prop_delay;
      end if;
   end process muxProcess;
end architecture behavior;

-- entity threeway_mux implementation
use work.dlx_types.all; 

entity threeway_mux is
     generic(prop_delay : Time := 5 ns);
     port (input_2,input_1,input_0 : in dlx_word; which: in threeway_muxcode; output: out dlx_word);
end entity threeway_mux;

architecture behavior of threeway_mux is
begin
   muxProcess : process(input_1, input_0, which) is
   begin
      if (which = "10" or which = "11" ) then
         output <= input_2 after prop_delay;
      elsif (which = "01") then 
	 output <= input_1 after prop_delay; 
       else
         output <= input_0 after prop_delay;
      end if;
   end process muxProcess;
end architecture behavior;

-- entity memory implementation
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity memory is
  port (
    address : in dlx_word;
    readnotwrite: in bit; 
    data_out : out dlx_word;
    data_in: in dlx_word; 
    clock: in bit); 
end memory;

architecture behavior of memory is
begin  
  mem_behav: process(address,clock) is
    -- Memory storage for first 1k addresses (for simulation speed)
    type memtype is array (0 to 1024) of dlx_word;
    variable data_memory : memtype;
  begin
    -- Initialize with test instructions and data
    data_memory(0) :=  X"30200000"; --LD R4, 0x100
    data_memory(1) :=  X"00000100"; -- address 0x100 for previous instruction
    data_memory(2) :=  "00000000000110000100010000000000"; -- ADDU R3,R1,R2
    data_memory(3) :=  X"00088300"; -- NOTB R7, R8, R9 -- test instruction
    
    -- Initialize test data
    data_memory(256) := "01010101000000001111111100000000";
    data_memory(257) := "10101010000000001111111100000000";
    data_memory(258) := "00000000000000000000000000000001";

    if clock = '1' then
      if readnotwrite = '1' then
        -- Read operation
        data_out <= data_memory(bv_to_natural(address)) after 5 ns;
      else
        -- Write operation
        data_memory(bv_to_natural(address)) := data_in; 
      end if;
    end if;
  end process mem_behav; 
end behavior;