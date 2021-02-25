restart
force -freeze sim:/alu/CLK 1 0, 0 {25 ps} -r 50
force -freeze sim:/alu/Sel(0) 1 0, 0 {25 ps} -r 50
force -freeze sim:/alu/Sel(1) 1 0, 0 {50 ps} -r 100
force -freeze sim:/alu/Sel(2) 1 0, 0 {100 ps} -r 200
force -freeze sim:/alu/Sel(3) 1 0, 0 {200 ps} -r 400
force -freeze sim:/alu/Sel(4) 1 0, 0 {400 ps} -r 800
force -freeze sim:/alu/Sel(5) 1 0, 0 {800 ps} -r 1600
force -freeze sim:/alu/Sel(6) 1 0, 0 {1600 ps} -r 3200
force -freeze sim:/alu/Sel(7) 1 0, 0 {3200 ps} -r 6400

force -freeze sim:/alu/Load(0) 1 0, 0 {25 ps} -r 50
force -freeze sim:/alu/Load(1) 1 0, 0 {50 ps} -r 100
force -freeze sim:/alu/Load(2) 1 0, 0 {100 ps} -r 200
force -freeze sim:/alu/Load(3) 1 0, 0 {200 ps} -r 400
force -freeze sim:/alu/Load(4) 1 0, 0 {400 ps} -r 800
force -freeze sim:/alu/Load(5) 1 0, 0 {800 ps} -r 1600

force -freeze sim:/alu/AMF 10011 0
force -freeze sim:/alu/CI 0 0
force -freeze sim:/alu/En(0) 1 0, 0 {50 ps} -r 100
force -freeze sim:/alu/En(1) 1 0, 0 {100 ps} -r 200
force -freeze sim:/alu/En(2) 1 0, 0 {200 ps} -r 400
force -freeze sim:/alu/En(3) 1 0, 0 {400 ps} -r 800
force -freeze sim:/alu/PMD 000000000000000000000001 0
force -freeze sim:/alu/DMD 0000000000000001 0
force -freeze sim:/alu/R 0000000000000000 0
run