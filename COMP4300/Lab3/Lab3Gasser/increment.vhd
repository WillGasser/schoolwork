library ieee;
library work;
use ieee.std_logic_1164.all;
use work.dlx_types.all;
use work.bv_arithmetic.all;

entity pcplusone is
  generic(
    prop_delay : time := 5 ns
  );
  port(
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
    variable carry       : boolean;
  begin
    if rising_edge(clock) then
      bv_addu(input, X"00000001", temp_result, carry);
      current_pc <= temp_result;
    end if;
  end process increment_process;
  
  output <= current_pc after prop_delay;
end architecture behavior;

