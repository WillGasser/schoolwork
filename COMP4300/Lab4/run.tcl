vsim aubie
add wave -position insertpoint sim:/aubie/*

force -freeze sim:/aubie/aubie_clock 0 0, 1 {50 ns} -r 100

run 6500 ns