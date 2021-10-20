library ieee;
use ieee.std_logic_1164.all;

entity eight_tb is
end eight_tb;
  
architecture behavior of eight_tb is 
  component eight 
    port(
        D_IN : in std_logic_vector(3 downto 0);
        SZ_OUT : out std_logic_vector(7 downto 0)
        );
  end component;

-- Input
signal D_IN : std_logic_vector(3 downto 0) := (others => '0');

-- Output 
signal SZ_OUT : std_logic_vector(6 downto 0);

begin 
  uut: eight port map(
                      D_IN => D_IN,
                      SZ_OUT => SZ_OUT  
                      );
  stim_proc: process
  begin 
    wait for 100 ns; -- hold reset state for 100 ns
    
    -- Stimuli: 
      D_IN <= '0000'; wait for 20 ns;
      D_IN <= '0001'; wait for 20 ns;
      D_IN <= '0010'; wait for 20 ns;
      D_IN <= '0011'; wait for 20 ns;
      D_IN <= '0100'; wait for 20 ns;
      D_IN <= '0101'; wait for 20 ns;
      D_IN <= '0110'; wait for 20 ns;
      D_IN <= '0111'; wait for 20 ns;
      D_IN <= '1000'; wait for 20 ns;
      D_IN <= '1001'; wait for 20 ns;
      D_IN <= '1010'; wait for 20 ns;
      D_IN <= '1011'; wait for 20 ns;
      D_IN <= '1100'; wait for 20 ns;
      D_IN <= '1101'; wait for 20 ns;
      D_IN <= '1110'; wait for 20 ns; 
      D_IN <= '1111'; wait for 20 ns;
     
    assert false report "Reached end of test";    
    wait;
  end process;
end behavior;
