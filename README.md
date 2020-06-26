# Mux-FSM-DataBus-inversor
 The following code shows the implementation of a finite state machine (fsm) and a parameterized Mux that receives an input bus of size BUS_DATA_SIZE and is divided into WORD_NUM words of size WORD_SIZE. This bus is inverted at the output, for example, if 0xABCD is received, 0xDCBA is obtained at the output.
# How to make/build
- if just feel lazy, just -make all-. 
- In the makefile you can find detailed information of synthesis, compilation and others.
# MODULES
- register.v : its used to change the order of the words. It looks like a small memory block.
- FSM.v : contains the control logic of the data flow and control flags for the inverter module
- FSM_MUX : top module, incorporates the instances of the necessary blocks as well as miselanic and transition logic
# Author
- Brandon Esquivel Molina, brandon.esquivel@ucr.ac.cr

