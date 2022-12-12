# Mips6stage
This is a 6 stage pipelined processor capable of forwarding and stalling
The extra stage is the register read stage which reads the register file .(traditional mips processor has 5 satges)
# main_unit
=>This is the top module used to conect all the other submodules.
=>Prefix of 'w' is used for denoting a wire connecting various modules. example: wstall=wire in the main module that is populated with the stall signal from hazard detection unit.
# reference used is patterson and hennesey 
