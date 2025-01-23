# Import everything in the pwntools namespace
from pwn import *


### case 1. when debugging, uncomment and fill in the following:
# Create an instance of the process to talk to
#io = gdb.debug(<PLEASE FILL IN>)
# Attach a debugger to the process so that we can step through
#pause()

### case 2. when exploiting, uncomment and fill in the following:
io = process(<PLEASE FILL IN>)



# wait for welcome message output to complete
io.recvuntil(<PLEASE FILL IN>)

# Overflow the buffer with some padding and a return address
exploit = b'A'*<PLEASE FILL IN> + p32(<PLEASE FILL IN>)

# send our payload to standard input
io.send(exploit)

# print out the program response
print(io.recv())


