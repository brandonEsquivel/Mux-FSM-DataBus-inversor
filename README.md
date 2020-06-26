# Mux-FSM-DataBus-inversor
 The following code shows the implementation of a finite state machine (fsm) and a parameterized Mux that receives an input bus of size BUS_DATA_SIZE and is divided into WORD_NUM words of size WORD_SIZE. This bus is inverted at the output, for example, if 0xABCD is received, 0xDCBA is obtained at the output.
 
 El siguiente código muestra la implementación de una máquina de estados finitos (fsm) y un Mux parametrizado que recibe un bus de entrada de tamaño BUS_DATA_SIZE y se divide en palabras WORD_NUM de tamaño WORD_SIZE. Este bus se invierte en la salida, por ejemplo, si se recibe 0xABCD, se obtiene 0xDCBA en la salida.

# How to make/build
- if just feel lazy, just -make all-. 
- In the makefile you can find detailed information of synthesis, compilation and others.

- si solo quieres compilar todo rápido, solo ejecuta -make all-.
- En el archivo MAKE puede encontrar información detallada de síntesis, compilación y otros.

# MODULES
- register.v : its used to change the order of the words. It looks like a small memory block.
- FSM.v : contains the control logic of the data flow and control flags for the inverter module
- FSM_MUX : top module, incorporates the instances of the necessary blocks as well as miselanic and transition logic.


- register.v: se usa para cambiar el orden de las palabras del Bus. Se puede ver como un pequeño bloque de memoria básico.
- FSM.v: contiene la lógica de control del flujo de datos y las banderas de control para el módulo inversor.
- FSM_MUX: módulo top en la jerarquía, incorpora las instancias de los bloques necesarios, así como la lógica miselánea y de transición general.


# MÓDULOS
- register.v: se usa para cambiar el orden de las palabras. Parece un pequeño bloque de memoria.
- FSM.v: contiene la lógica de control del flujo de datos y las banderas de control para el módulo inversor
- FSM_MUX: módulo superior, incorpora las instancias de los bloques necesarios, así como la lógica de transición y miselanic

# Author
- Brandon Esquivel Molina, brandon.esquivel@ucr.ac.cr

