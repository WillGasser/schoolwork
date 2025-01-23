import java.io.Serializable;

public class Request implements Serializable {
    private int opCode;
    private int operand1;
    private int operand2;
    private int requestID;
    private String opName;

    public Request(int opCode, int operand1, int operand2, int requestID, String opName) {
        this.opCode = opCode;
        this.operand1 = operand1;
        this.operand2 = operand2;
        this.requestID = requestID;
        this.opName = opName;
    }

    public int getOpCode() {
        return opCode;
    }

    public int getOperand1() {
        return operand1;
    }

    public int getOperand2() {
        return operand2;
    }

    public int getRequestID() {
        return requestID;
    }

    public String getOpName() {
        return opName;
    }
}
