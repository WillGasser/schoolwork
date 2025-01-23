import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

public class RequestEncoder {
    public byte[] encode(Request request) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        DataOutputStream dos = new DataOutputStream(baos);

        try {
            // TML 
            String opName = request.getOpName();
            byte[] opNameBytes = opName.getBytes(StandardCharsets.UTF_16);
            int tml = 9 + opNameBytes.length; 
            dos.writeShort(tml);

            // OpCode
            dos.writeByte(request.getOpCode());

            // Op1/Op2
            dos.writeShort(request.getOperand1());
            dos.writeShort(request.getOperand2());

            // RequestID
            dos.writeByte(request.getRequestID());

            // OpName Length
            dos.writeByte(opNameBytes.length / 2);

            // OpName UTF-16
            dos.write(opNameBytes);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return baos.toByteArray();
    }
}
