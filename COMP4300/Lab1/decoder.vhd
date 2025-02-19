library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity twobitdecoder is
  generic(prop_delay: time := 10 ns);
  port(
    encoded: in bit_vector(1 downto 0);
    out0, out1, out2, out3: out bit
  );
end twobitdecoder;

architecture Behavioral of twobitdecoder is
begin
  process(encoded)
  begin
    out0 <= '0'; out1 <= '0'; out2 <= '0'; out3 <= '0';
    case encoded is
      when "00" => out0 <= '1' after prop_delay;
      when "01" => out1 <= '1' after prop_delay;
      when "10" => out2 <= '1' after prop_delay;
      when "11" => out3 <= '1' after prop_delay;
      when others => null;
    end case;
  end process;
end Behavioral;

