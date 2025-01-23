import java.io.*;
import java.net.*;
import java.nio.*;

public class ServerUDP {

    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Parameter(s): <port>");
            return;
        }

        int port = Integer.parseInt(args[0]);

        try (DatagramSocket socket = new DatagramSocket(port)) {
            byte[] buffer = new byte[1024];
            while (true) {
                DatagramPacket requestPacket = new DatagramPacket(buffer, buffer.length);
                socket.receive(requestPacket);

                displayPacketInHex(requestPacket.getData(), requestPacket.getLength());

                byte[] response = processRequest(requestPacket.getData(), requestPacket.getLength());

                // sending packet
                DatagramPacket responsePacket = new DatagramPacket(response, response.length, requestPacket.getAddress(), requestPacket.getPort());
                socket.send(responsePacket);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void displayPacketInHex(byte[] data, int length) {
        System.out.println("Received request (in hex):");
        for (int i = 0; i < length; i++) {
            System.out.printf("%02X ", data[i]);
        }
        System.out.println();
    }

    private static byte[] processRequest(byte[] data, int length) {
        ByteBuffer buffer = ByteBuffer.wrap(data);

        int tml = buffer.getShort();                // tml
        byte opcode = buffer.get();                // op code
        short operand1 = buffer.getShort();       // op 1
        short operand2 = buffer.getShort();      // op 2
        byte requestId = buffer.get();          // r ID
        byte opNameLength = buffer.get();      // op name len

        System.out.println("Request ID: " + requestId);
        System.out.println("Operation: " + code(opcode));
        System.out.println("Operands: " + operand1 + " and " + operand2);

        int result = operation(opcode, operand1, operand2);
        byte errorCode = 0; 

        ByteBuffer responseBuffer = ByteBuffer.allocate(8);
        responseBuffer.putShort((short) 8);   // TML 
        responseBuffer.put(requestId);        // r ID
        responseBuffer.putInt(result);        // calc Result
        responseBuffer.put(errorCode);        // error code

        return responseBuffer.array();
    }

    private static String code(byte opcode) {
        switch (opcode) {
            case 0: return "/";
            case 1: return "*";
            case 2: return "&";
            case 3: return "|";
            case 4: return "+";
            case 5: return "-";
            default: return "Unknown";
        }
    }

    private static int operation(byte opcode, short operand1, short operand2) {
        switch (opcode) {
            case 0: return operand1 / operand2;
            case 1: return operand1 * operand2;
            case 2: return operand1 & operand2;
            case 3: return operand1 | operand2;
            case 4: return operand1 + operand2;
            case 5: return operand1 - operand2;
            default: return 0;
        }
    }
}
