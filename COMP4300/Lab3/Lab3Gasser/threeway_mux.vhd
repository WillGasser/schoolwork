library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity threeway_mux is
  generic(
    prop_delay : time := 5 ns
  );
  port(
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

