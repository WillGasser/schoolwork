vsim aubie
add wave -position insertpoint sim:/aubie/*
add wave -position insertpoint sim:/aubie/aubie_regfile/reg_file/registers
add wave -position insertpoint sim:/aubie/aubie_memory/mem_behav/data_memory

force sim:/aubie/aubie_clock 0 0, 1 100 -repeat 200

run 6500 ns