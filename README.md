# Eight Segment Decoder Project

### About:

For this project, I created a eight segment decoder with the use of VHDL code. The decoder has an output of *SZ_OUT*. A digital decoder is a device which converts one digital format into another. The Binary Coded Decimal (BCD) to 8 Segment Decoder converts 4 bit binary to 8 bit control signal. The circuit contains an input bundle of four signals and an output bundle of eight signals. The input bundle, *D_IN*, represents a 4-bit binary number. The output bundle, *SZ_OUT*, is used to indicate the magnitude of the 4-bit binary input number. The relationship between the input and output is shown in the table below. 

**The relationship between the input and output**

![1](https://user-images.githubusercontent.com/89553126/138173719-e1a988d6-6d27-4d6a-98d7-5ccabaca061f.png)

**Black box**

<img width="377" alt="Screen Shot 2021-10-20 at 8 12 43 PM" src="https://user-images.githubusercontent.com/89553126/138193587-ce2b881a-8a87-48be-9326-c182c0f5ba8a.png">
 
### Results:

In VHDL, *D_IN* is an input (**IN**), and *SZ_OUT* is an output (**OUT**) of my project.

**I/O's are specified here (the circuit is specified using a Hardware Desciption Language)**

<img width="337" alt="Screen Shot 2021-10-20 at 8 55 31 PM" src="https://user-images.githubusercontent.com/89553126/138197803-2a5d278b-2054-4594-bbb8-86b9112a5c66.png">

**Internal description of the eight segment decoder is specified here**

<img width="337" alt="Screen Shot 2021-10-20 at 8 56 45 PM" src="https://user-images.githubusercontent.com/89553126/138197901-996ac5be-fc16-46ac-9597-3b72d6395372.png">
 
The vertical bar is used as a selection character in the choices section of the selected signal assignment statement. This increases the readability of the code. The selected signal assignment statement is one form of a concurrent statement. This is verified by the fact that there is only one signal assignment statement in the body of the selected signal assignment statement.

The selected signal assignment statement is evaluated each time there is a change in the chooser expression listed in the first line of the selected signal assignment statement. Re-evaluation also occurs every time there is a change in a conditional signal on the right-hand side of the signal assignment operator.

Afterwards, I worked on the behavioral (functional) simulation. Here, I will only verify the logical operation of the circuit. Stimuli is provided to the logic circuit, so I can verify the outputs behave as I expect. The VHDL file called 'eight_tb' is where I specified the stimuli to the logic circuit.

<img width="590" alt="Screen Shot 2021-10-20 at 9 01 59 PM" src="https://user-images.githubusercontent.com/89553126/138198403-5afce0b7-f29a-4468-9a1a-07ef6630a228.png">

<img width="475" alt="Screen Shot 2021-10-20 at 9 02 16 PM" src="https://user-images.githubusercontent.com/89553126/138198423-67e2909b-cfa3-42ae-b13a-5e18b8dd11b3.png">

The entity block has no input or output singals going into or out of the '*testbench*', which makes sense since '*testbench*' is a complete unit. The '*testbench*' will go ahead and send the signals to the circuit in which it will read back those signals. Afterwards, I could check out whether these signals are correct. Therefore, I don't need anything going into or out of the testbench. Additionally, a process was created so that I could deliver signals sequentially and not concurrenlty.

Finally, I verified the units outputted by using a waveform viewer.

**D_IN = 0000 → D_IN = 0111**

![0](https://user-images.githubusercontent.com/89553126/138167195-c8e20729-9058-4e55-9d2d-fb4533275fcf.png)

**D_IN = 1000 → D_IN = 1111**

![1](https://user-images.githubusercontent.com/89553126/138167202-9f146847-3e7f-4bed-99ae-c682147eab5c.png)
 
Looking back to the the relationship between the input and output adn the black box, the code produce what should be expected, therefore, I know my eight segment decoder code is logically correct. 
