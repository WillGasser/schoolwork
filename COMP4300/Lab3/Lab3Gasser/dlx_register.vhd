library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

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

