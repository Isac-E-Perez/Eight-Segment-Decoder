library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_tb is
end seven_tb;
  
architecture behavior of seven_tb is 
  component seven 
    port(
        S : in unsigned(3 downto 0);
        segments : out std_logic_vector(6 downto 0)
        );
  end component;

-- Input
signal S : unsigned(3 downto 0) := 4d"0";

-- Output 
signal segments : std_logic_vector(6 downto 0);

begin 
  uut: seven port map(
                      S => S
                      segments => segments  
                      );
  stim_proc: process
    begin 
      for i in 0 to 15 loop
        S <= to_unsigned(i, 4);
        wait for 10 ns;
      end loop
      wait;
    end process;
end behavior;
