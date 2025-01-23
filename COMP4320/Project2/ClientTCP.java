import java.io.*;
import java.net.*;
import java.util.Random;
import java.util.Scanner;

public class ClientTCP {
    private static Random random = new Random();  

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: java ClientTCP <hostname> <port number>");
            System.exit(1);
        }

        String hostName = args[0];
        int portNumber = Integer.parseInt(args[1]);

        try (Socket socket = new Socket(hostName, portNumber);
             DataOutputStream out = new DataOutputStream(socket.getOutputStream());
             DataInputStream in = new DataInputStream(socket.getInputStream());
             Scanner scanner = new Scanner(System.in)) {

            boolean keepRunning = true;

            while (keepRunning) {
                // userInput
                System.out.print("Enter OpCode (0-5): ");
                int opCode = scanner.nextInt();
                System.out.print("Enter Operand 1: ");
                int operand1 = scanner.nextInt();
                System.out.print("Enter Operand 2: ");
                int operand2 = scanner.nextInt();

                // Generate random request ID (0-100) and map OpCode to OpName
                int requestID = random.nextInt(101);
                String opName = getOpName(opCode);

                // Create the request object
                Request request = new Request(opCode, operand1, operand2, requestID, opName);
                RequestEncoder encoder = new RequestEncoder();  
                byte[] requestBytes = encoder.encode(request);

                // Measure round trip time
                long startTime = System.nanoTime();
                out.writeInt(requestBytes.length);
                out.write(requestBytes); 

                // Receive the response
                int responseLength = in.readInt(); 
                byte[] responseBytes = new byte[responseLength];
                in.readFully(responseBytes); 

                long endTime = System.nanoTime();
                long roundTripTime = (endTime - startTime) / 1_000_000;  // ms

                System.out.println("Round Trip Time: " + roundTripTime + " ms");

                // Decode response and display
                int requestIDResponse = responseBytes[2];  // Request ID
                int result = ((responseBytes[3] & 0xFF) << 24) |
                             ((responseBytes[4] & 0xFF) << 16) |
                             ((responseBytes[5] & 0xFF) << 8) |
                             (responseBytes[6] & 0xFF);
                int errorCode = responseBytes[7];

                System.out.println("Request ID: " + requestIDResponse);
                System.out.println("Result: " + result);
                System.out.println("Error Code: " + (errorCode == 0 ? "0" : "127"));

                // Ask for next request
                System.out.print("Send another request? (y/n): ");
                String choice = scanner.next();
                if (choice.equalsIgnoreCase("n")) {
                    keepRunning = false;
                }
            }

        } catch (IOException e) {
            System.out.println("Exception caught when trying to connect to " + hostName + " on port " + portNumber);
            System.out.println(e.getMessage());
        }
    }

    // simple switch case for opCodes
    private static String getOpName(int opCode) {
        switch (opCode) {
            case 0: return "div";
            case 1: return "mul";
            case 2: return "and";
            case 3: return "or";
            case 4: return "add";
            case 5: return "sub";
            default: return "unknown";
        }
    }
}
