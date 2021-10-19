library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven is 
  port(
      D_IN : in unsigned(3 downto 0);
      SZ_OUT : out std_logic_vector(7 downto 0)
      );
end seven; 
    
architecture behavior of eight is
  
begin 
  with D_IN select
    SZ_OUT <=   "10000000" when "0000"|"0001",
                "01000000" when "0010"|"0011",
                "00100000" when "0100"|"0101",
                "00010000" when "0110"|"0111",
                "00001000" when "1000"|"1001",
                "00000100" when "1010"|"1011",
                "00000010" when "1100"|"1101",
                "00000001" when "1110"|"1111",
                "00000000" when others;
  
end behavior;
