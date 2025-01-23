import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class RequestDecoder {
    public Request decode(byte[] data) {
        ByteArrayInputStream bais = new ByteArrayInputStream(data);
        DataInputStream dis = new DataInputStream(bais);

        try {
            // Read the fields
            int tml = dis.readShort();  // TML
            int opCode = dis.readByte();  // OpCode
            int operand1 = dis.readShort();  // Operand1
            int operand2 = dis.readShort();  // Operand2
            int requestID = dis.readByte();  // RequestID
            int opNameLength = dis.readByte();  // OpName Length 

            byte[] opNameBytes = new byte[opNameLength * 2];  // UTF-16 
            dis.readFully(opNameBytes);
            String opName = new String(opNameBytes, StandardCharsets.UTF_16);

            return new Request(opCode, operand1, operand2, requestID, opName);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
