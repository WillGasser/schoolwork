import java.io.*;
import java.net.*;
import java.nio.*;
import java.util.*;

public class ClientUDP {

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Parameter(s): <server> <port>");
            return;
        }

        String serverName = args[0];
        int port = Integer.parseInt(args[1]);

        try (DatagramSocket socket = new DatagramSocket()) {
            Scanner scanner = new Scanner(System.in);

            while (true) {
                System.out.print("Enter OpCode (0 = /, 1 = *, 2 = &, 3 = |, 4 = +, 5 = -): ");
                byte opCode = scanner.nextByte();

                System.out.print("Enter Operand 1: ");
                short operand1 = scanner.nextShort();

                System.out.print("Enter Operand 2: ");
                short operand2 = scanner.nextShort();

                byte requestId = (byte) (Math.random() * 1024);  // it is just random? I felt like it was an abitrary ticketing number

                byte[] request = request(opCode, operand1, operand2, requestId);

                System.out.println("Request sent (in hex):");
                for (byte b : request) {
                    System.out.printf("%02X ", b);
                }
                System.out.println();

                long startTime = System.nanoTime();

                // request
                InetAddress serverAddress = InetAddress.getByName(serverName);
                DatagramPacket requestPacket = new DatagramPacket(request, request.length, serverAddress, port);
                socket.send(requestPacket);

                // get response
                byte[] responseBuffer = new byte[8];
                DatagramPacket responsePacket = new DatagramPacket(responseBuffer, responseBuffer.length);
                socket.receive(responsePacket);

                long endTime = System.nanoTime();
                double roundTripTime = (endTime - startTime) / 1000000.0; // ns to ms

                System.out.println("Response received (in hex):");
                for (byte b : responseBuffer) {
                    System.out.printf("%02X ", b);
                }
                System.out.println();

                processResponse(responseBuffer);

                System.out.printf("Round Trip Time: %.2f ms\n", roundTripTime);

                // prompt continue
                System.out.print("Do you want to make another request? (y/n): ");
                String cont = scanner.next();
                if (cont.equalsIgnoreCase("n")) {
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static byte[] request(byte opCode, short operand1, short operand2, byte requestId) {
        ByteBuffer buffer = ByteBuffer.allocate(15);
        buffer.putShort((short) 15);      // tml
        buffer.put(opCode);               // op code
        buffer.putShort(operand1);        // op1
        buffer.putShort(operand2);        // op2
        buffer.put(requestId);            // r ID
        buffer.put((byte) 6);             // op len
        buffer.put("opName".getBytes());  // opName
        return buffer.array();
    }

    private static void processResponse(byte[] response) {
        ByteBuffer buffer = ByteBuffer.wrap(response);

        short tml = buffer.getShort();    // TML
        byte requestId = buffer.get();    // r ID
        int result = buffer.getInt();     // processed results
        byte errorCode = buffer.get();    // error code

        System.out.println("Request ID: " + requestId);
        System.out.println("Operation Result: " + result);
        System.out.println("Error Code: " + (errorCode == 0 ? "0" : "127"));
    }
}
