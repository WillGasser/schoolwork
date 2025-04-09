library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity reg_file is
  port(
    data_in      : in  dlx_word;
    readnotwrite : in  bit;
    clock        : in  bit;
    data_out     : out dlx_word;
    reg_number   : in  register_index
  );
end entity reg_file;

architecture behavior of reg_file is
  -- Define an array type for 32 registers.
  type reg_type is array (0 to 31) of dlx_word;
begin
  reg_file_process: process(clock)
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

