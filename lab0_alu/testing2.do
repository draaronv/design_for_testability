restart
force -freeze sim:/alu/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/alu/En 1111 0
force -freeze sim:/alu/Sel 00000000 0
force -freeze sim:/alu/Load 111111 0
noforce sim:/alu/PMD
noforce sim:/alu/DMD
noforce sim:/alu/R
run
force -freeze sim:/alu/Sel 00001100 0
force -freeze sim:/alu/Load 111110 0
force -freeze sim:/alu/En 1111 0
run