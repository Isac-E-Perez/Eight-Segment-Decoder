# Eight Segment Decoder Project

### About:

For this project, I created an eight segment decoder with the use of VHDL code. The decoder has an output of *SZ_OUT*. A digital decoder is a device which converts one digital format into another. The Binary Coded Decimal (BCD) to 8 Segment Decoder converts 4 bit binary to 8 bit control signal. The circuit contains an input bundle of four signals and an output bundle of eight signals. The input bundle, *D_IN*, represents a 4-bit binary number. The output bundle, *SZ_OUT*, is used to indicate the magnitude of the 4-bit binary input number. The relationship between the input and output is shown in the table below. 

**The relationship between the input and output**

![1](https://user-images.githubusercontent.com/89553126/138173719-e1a988d6-6d27-4d6a-98d7-5ccabaca061f.png)

**Black box**

<img width="377" alt="Screen Shot 2021-10-20 at 8 12 43 PM" src="https://user-images.githubusercontent.com/89553126/138193587-ce2b881a-8a87-48be-9326-c182c0f5ba8a.png">
 
### Results:

In VHDL, *D_IN* is an input (**IN**), and *SZ_OUT* is an output (**OUT**) of my project.

**I/O's are specified here (the circuit is specified using a Hardware Desciption Language)**

```VHDL
library ieee;
use ieee.std_logic_1164.all;

entity eight is 
  port(
    D_IN : in std_logic_vector(3 downto 0);
    SZ_OUT : out std_logic_vector(7 downto 0)
    );
end eight; 
```

**Internal description of the eight segment decoder is specified here**

```VHDL
architecture behavior of eight is
  
begin 
  with D_IN select
    SZ_OUT <= "10000000" when "0000"|"0001",
              "01000000" when "0010"|"0011",
              "00100000" when "0100"|"0101",
              "00010000" when "0110"|"0111",
              "00001000" when "1000"|"1001",
              "00000100" when "1010"|"1011",
              "00000010" when "1100"|"1101",
              "00000001" when "1110"|"1111",
              "00000000" when others;  
end behavior;
```
 
The vertical bar is used as a selection character in the choices section of the selected signal assignment statement. This increases the readability of the code. The selected signal assignment statement is one form of a concurrent statement. This is verified by the fact that there is only one signal assignment statement in the body of the selected signal assignment statement.

The selected signal assignment statement is evaluated each time there is a change in the chooser expression listed in the first line of the selected signal assignment statement. Re-evaluation also occurs every time there is a change in a conditional signal on the right-hand side of the signal assignment operator.

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the operations of the circuit. Stimuli is provided to the circuit, so I can verify the outputs behave as I expect. The VHDL file called 'eight_tb' is where I specified the stimuli to the circuit.

```VHDL
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
signal D_IN : std_logic_vector(3 downto 0) := (others => '0'); -- default value

-- Output 
signal SZ_OUT : std_logic_vector(7 downto 0);

begin 
  uut: eight port map(D_IN => D_IN, SZ_OUT => SZ_OUT);
  
	stim_proc: process
	begin 
		wait for 100 ns; -- hold reset state for 100 ns
    
		-- Stimuli: 
		D_IN <= "0000"; wait for 20 ns;
		D_IN <= "0001"; wait for 20 ns;
		D_IN <= "0010"; wait for 20 ns;
		D_IN <= "0011"; wait for 20 ns;
		D_IN <= "0100"; wait for 20 ns;
		D_IN <= "0101"; wait for 20 ns;
		D_IN <= "0110"; wait for 20 ns;
		D_IN <= "0111"; wait for 20 ns;
		D_IN <= "1000"; wait for 20 ns;
		D_IN <= "1001"; wait for 20 ns;
		D_IN <= "1010"; wait for 20 ns;
		D_IN <= "1011"; wait for 20 ns;
		D_IN <= "1100"; wait for 20 ns;
		D_IN <= "1101"; wait for 20 ns;
		D_IN <= "1110"; wait for 20 ns; 
		D_IN <= "1111"; wait for 20 ns;
     
		assert false report "Reached end of test";    
		wait;
	end process;
end behavior;
```

The entity block has no input or output singals going into or out of the '*testbench*', which makes sense since '*testbench*' is a complete unit. The '*testbench*' will go ahead and send the signals to the circuit in which it will read back those signals. Afterwards, I could check out whether these signals are correct. Therefore, I don't need anything going into or out of the testbench. Additionally, the process statement is a concurrent statement which is constituted of sequential statements exclusively.

Finally, I verified the units outputted by using a waveform viewer.

**D_IN = 0000 → D_IN = 0111**

![0](https://user-images.githubusercontent.com/89553126/138167195-c8e20729-9058-4e55-9d2d-fb4533275fcf.png)

**D_IN = 1000 → D_IN = 1111**

![1](https://user-images.githubusercontent.com/89553126/138167202-9f146847-3e7f-4bed-99ae-c682147eab5c.png)
 
Looking back to the relationship between the input and output, waveform and the black box, the code produce what should be expected, therefore, I know my eight segment decoder code is operating correctly. 
