library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity mux is
  generic(
    prop_delay : time := 5 ns
  );
  port(
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

