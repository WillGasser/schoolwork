# Start the simulation
vsim work.aubie

# Restart to make sure we're starting from a clean state
restart -f

# Add waves to watch
add wave -position insertpoint -radix hex sim:/aubie/*

force -deposit sim:/aubie/aubie_clock '0' 0 ns, '1' 100 ns -repeat 200 ns



# Run the simulation
run 6500 ns