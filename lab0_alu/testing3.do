restart
force -freeze sim:/alu/CLK 1 0, 0 {50 ps} -r 100
force -freeze sim:/alu/Sel 00001101 0
noforce sim:/alu/R
noforce sim:/alu/DMD
noforce sim:/alu/PMD
run
force -freeze sim:/alu/Sel 00000001 0
run