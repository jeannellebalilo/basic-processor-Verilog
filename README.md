# Basic System Verilog Processor
## Navigating the code:
### Our code is separated into three main folders, program1, program2, and program3. The following files are the same in each folder: ALU.sv, Ctrl.sv, DataMem.sv, Definitions.sv, LUT_2x_dm.sv, LUT_dm.sv, LUT_pc.sv, ProgCtr.sv, RegFile.sv, and TopLevel.sv. In addition, there are several testbench files in each folder that should not be affecting their performance, and were used solely for testing on our end. Prog1Assembly.txt, Prog2Assembly.txt, and Prog3Assembly.txt are converted by assembly.py into program1.txt, program2.txt, and program3.txt, respectively. InstROM.sv then takes in these 3 in their respective folders as the instruction memories to be executed.
## What works:
### All of the modules were tested individually and work, as well as the python assembler assembly.py. The assembly code for Program 1 and Program 3 are also correct and generate the expected outputs when tested with inputs. We believe our ISA can handle the correcting parity bits, as Program 2 is supposed to do.
## What doesn't work:
### The assembly code for Program 2 does not work. We believe the ISA can handle the program, however we did not finish getting the assembly code finished for Program 2.
## Distribution of work:
### The majority of the pieces of the project were done together, planning things in person and meeting online using ZOOM. Due to scheduling conflicts, a few parts were divided equally, such as writing the assembler python file and going back to re-factor the assembly code to use our up-to-date ISA.
### Jeannelle spent approximately 30 hours in total working on this project, while Ivan spent about 25 hours. 
