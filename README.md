# C-A_code
Implement the Gold code generator that generates the C/A code.
1. The gold code generator for the C/A code consists of two shift registers with 10 memory elements each (see Fig. 1) 
2. The first shift register (SR1) is fixed for all satellites. At each chip, the content of the first memory element is the result of XORing the 3rd and 10th memory elements, and 
The output code from SR1 is simply the output of 10th memory element. Note that you should do the XOR operation before shift
3. For the second shift register (SR2). The content of the first memory element is the result of XORing of (2, 3, 6, 8, 9, 10) memory elements. All satellites have the same configuration except for calculating the output. Each satellite has different “phase tap”, i.e., different connection at the output. For the purpose of this simulation, connect memory elements (3, 8) as in Fig. 1.
4. Generate the output of SR1 by initializing it to 1111111111 and the output of SR2 by 
initializing it to 111111111. The C/A code the XOR of the two outputs.
5. Now, perform the following on the output code.
   - For phase tap (3,8)
     - Get 1023 chip of the C/A code
     - Plot the autocorrelation function of the entire C/A code
   - Change the phase taps to (2, 6) 
     - Get the new 1023 chip of the C/A code
     - Plot the autocorrelation function of the new C/A code
   - Cross -correlation
     - Plot the cross- correlation function between the two codes
<p align="center">
  <img src ="https://github.com/AsmaaEssamSultan/C-A_code/blob/main/C_A_code.PNG?raw=true"><br/>
   Figure 1: C/A code generation
</p>


