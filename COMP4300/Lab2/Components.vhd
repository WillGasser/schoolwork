library ieee;
library work;
use ieee.std_logic_1164.all;
-- If needed, include numeric_std for conversions (or rely on bv_arithmetic functions)
use work.dlx_types.all;
use work.bv_arithmetic.all;

------------------------------------------------------------------
-- 32-bit Single-Value Register (dlx_register)
-- Propagation delay: 10 ns
-- On clock = '1', copies in_val to out_val.
-- When clock is '0', the output remains unchanged.
------------------------------------------------------------------
entity dlx_register is
  port(
    in_val : in  dlx_word;
    clock  : in  bit;
    out_val: out dlx_word
  );
end entity dlx_register;

architecture behavior of dlx_register is
  signal stored_val : dlx_word := (others => '0');
begin
  reg_process: process(in_val, clock)
  begin
    if (clock = '1') then
      stored_val <= in_val after 10 ns;
    end if;
  end process reg_process;
  
  out_val <= stored_val;
end architecture behavior;

------------------------------------------------------------------
-- Register File (reg_file)
-- 32 registers of type dlx_word.
-- Read operation (readnotwrite = '1') outputs register value after 15 ns delay.
-- Write operation (readnotwrite = '0') immediately stores data_in.
-- Uses a variable array (declared within the process) to hold registers.
------------------------------------------------------------------
entity reg_file is
  port(
    data_in     : in  dlx_word;
    readnotwrite: in  bit;
    clock       : in  bit;
    data_out    : out dlx_word;
    reg_number  : in  register_index
  );
end entity reg_file;

architecture behavior of reg_file is
  -- Define an array type for 32 registers.
  type reg_type is array (0 to 31) of dlx_word;
begin
  reg_file_process: process(clock)
    -- Using a variable ensures a single-process implementation.
    variable registers : reg_type := (others => (others => '0'));
  begin
    if rising_edge(clock) then
      if readnotwrite = '1' then
        -- Read operation: output the selected register value with a 15 ns delay.
        data_out <= registers(bv_to_integer(reg_number)) after 15 ns;
      else
        -- Write operation: update the selected register with data_in.
        registers(bv_to_integer(reg_number)) := data_in;
      end if;
    end if;
  end process reg_file_process;
end architecture behavior;

------------------------------------------------------------------
-- Two-Way Multiplexer (mux)
-- Copies input_0 or input_1 to output based on the value of which.
-- Propagation delay is specified by the generic prop_delay.
------------------------------------------------------------------
entity mux is
  generic(
    prop_delay : time := 5 ns
  );
  port (
    input_1 : in  dlx_word;
    input_0 : in  dlx_word;
    which   : in  bit;
    output  : out dlx_word
  );
end entity mux;

architecture behavior of mux is
begin
  mux_process: process(input_1, input_0, which)
  begin
    if (which = '0') then
      output <= input_0 after prop_delay;
    else
      output <= input_1 after prop_delay;
    end if;
  end process mux_process;
end architecture behavior;

------------------------------------------------------------------
-- Three-Way Multiplexer (threeway_mux)
-- Selects one of three inputs based on a two-bit code (threeway_muxcode).
-- If an invalid code is provided (when others), defaults to input_0.
-- Propagation delay is specified by the generic prop_delay.
------------------------------------------------------------------
entity threeway_mux is
  generic(
    prop_delay : time := 5 ns
  );
  port (
    input_2 : in  dlx_word;
    input_1 : in  dlx_word;
    input_0 : in  dlx_word;
    which   : in  threeway_muxcode;
    output  : out dlx_word
  );
end entity threeway_mux;

architecture behavior of threeway_mux is
begin
  mux_process: process(input_2, input_1, input_0, which)
  begin
    case which is
      when "00" =>
        output <= input_0 after prop_delay;
      when "01" =>
        output <= input_1 after prop_delay;
      when "10" =>
        output <= input_2 after prop_delay;
      when others =>
        output <= input_0 after prop_delay;  -- Default case
    end case;
  end process mux_process;
end architecture behavior;

------------------------------------------------------------------
-- PC Incrementer (pcplusone)
-- Increments the 32-bit unsigned value at its input on a rising clock edge.
-- Uses the bv_addu function from the bv_arithmetic package.
-- Propagation delay is specified by the generic prop_delay.
------------------------------------------------------------------
entity pcplusone is
  generic(
    prop_delay : time := 5 ns
  );
  port (
    input  : in  dlx_word;
    clock  : in  bit;
    output : out dlx_word
  );
end entity pcplusone;

architecture behavior of pcplusone is
  signal current_pc : dlx_word := (others => '0');
begin
  increment_process: process(clock)
    variable temp_result : dlx_word;
    variable carry       : bit;
  begin
    if rising_edge(clock) then
      -- Increment using the bv_addu function; overflow behavior is allowed.
      bv_addu(input, X"00000001", temp_result, carry);
      current_pc <= temp_result;
    end if;
  end process increment_process;
  
  output <= current_pc after prop_delay;
end architecture behavior;

