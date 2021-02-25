restart
force -freeze sim:/alu/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/alu/Load 111111 0
force -freeze sim:/alu/DMD 0000000000000001 0
noforce sim:/alu/R
force -freeze sim:/alu/PMD 000000000000000100000000 0
force -freeze sim:/alu/AMF 10011 0
force -freeze sim:/alu/CI 0 0
force -freeze sim:/alu/En 1111 0
force -freeze sim:/alu/Sel 00000100 0
run
force -freeze sim:/alu/Sel 00000000 0
run