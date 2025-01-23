import java.io.*;
import java.net.*;

public class ServerTCP {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: java ServerTCP <port number>");
            System.exit(1);
        }

        int portNumber = Integer.parseInt(args[0]);

        try (ServerSocket serverSocket = new ServerSocket(portNumber)) {
            System.out.println("Server is listening on port " + portNumber);

            while (true) {
                try (Socket clientSocket = serverSocket.accept()) {
                    System.out.println("New client connected");

                    // Keep the connection open for multiple requests
                    handleClientRequests(clientSocket);

                } catch (IOException e) {
                    System.out.println("Exception caught when trying to listen on port " + portNumber + " or listening for a connection");
                    System.out.println(e.getMessage());
                }
            }
        } catch (IOException e) {
            System.out.println("Could not listen on port " + portNumber);
            System.exit(-1);
        }
    }

    private static void handleClientRequests(Socket clientSocket) {
        try (DataInputStream in = new DataInputStream(clientSocket.getInputStream());
             DataOutputStream out = new DataOutputStream(clientSocket.getOutputStream())) {

            // Continuously handle client requests until the client disconnects
            while (true) {
                try {
        
                    byte[] requestBytes = new byte[in.readInt()]; 
                    in.readFully(requestBytes);

                    RequestDecoder decoder = new RequestDecoder();  // Use RequestDecoder
                    Request request = decoder.decode(requestBytes);

                    
                    int result = 0;
                    int errorCode = 0;
                    try {
                        result = processRequest(request);  
                    } catch (ArithmeticException e) {
             
                        result = 0;
                        errorCode = 127;
                    }

                    // Form and send the response
                    byte[] response = createResponse(request.getRequestID(), result, errorCode);  
                    out.writeInt(response.length);
                    out.write(response);

            
                    System.out.println("Processed request ID " + request.getRequestID() + " with result: " + result);

                } catch (EOFException e) {
                    // Client closed the connection
                    System.out.println("Client disconnected.");
                    break;
                } catch (IOException e) {
                    System.out.println("Error processing client request: " + e.getMessage());
                    break;
                }
            }

        } catch (IOException e) {
            System.out.println("Error handling client requests: " + e.getMessage());
        }
    }

    private static int processRequest(Request request) throws ArithmeticException {
        switch (request.getOpCode()) {
            case 0:  // Division
                if (request.getOperand2() == 0) {
                    throw new ArithmeticException("Division by zero");
                }
                return request.getOperand1() / request.getOperand2();
            case 1:  // Multiplication
                return request.getOperand1() * request.getOperand2();
            case 2:  // Bitwise AND
                return request.getOperand1() & request.getOperand2();
            case 3:  // Bitwise OR
                return request.getOperand1() | request.getOperand2();
            case 4:  // Addition
                return request.getOperand1() + request.getOperand2();
            case 5:  // Subtraction
                return request.getOperand1() - request.getOperand2();
            default:
                return 127;  
        }
    }

    private static byte[] createResponse(int requestID, int result, int errorCode) {
        // Create a response array 
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream dos = new DataOutputStream(baos);

        try {
            dos.writeShort(8);  // TML
            dos.writeByte(requestID);
            dos.writeInt(result);
            dos.writeByte(errorCode);  
        } catch (IOException e) {
            e.printStackTrace();
        }

        return baos.toByteArray();
    }
}
