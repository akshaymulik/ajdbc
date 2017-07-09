import java.io.BufferedReader; import java.io.InputStreamReader;
import java.io.OutputStream;   import gnu.io.CommPortIdentifier;
import gnu.io.SerialPort;      import gnu.io.SerialPortEvent;
import java.util.Enumeration;  import gnu.io.SerialPortEventListener;
import java.sql.*;             import java.util.*;

public class Dbx implements SerialPortEventListener
{ SerialPort serialPort;
	private static final String PORT_NAMES[] = {"/dev/ttyACM0"/*Raspberry Pi*/,"/dev/ttyUSB0"/*Linux*/};
	private BufferedReader input;
	private OutputStream output;/** The output stream to the port */
	private static final int TIME_OUT = 2000;/** Milliseconds to block while waiting for port open */
	private static final int DATA_RATE = 9600;/** Default bits per second for COM port.AKA-Baud-RAte */
	public void initialize(){
    System.setProperty("gnu.io.rxtx.SerialPorts", "/dev/ttyACM0");
		CommPortIdentifier portId = null;
		Enumeration portEnum = CommPortIdentifier.getPortIdentifiers();
		while (portEnum.hasMoreElements()) {CommPortIdentifier currPortId = (CommPortIdentifier) portEnum.nextElement();for (String portName : PORT_NAMES){if (currPortId.getName().equals(portName)) {portId = currPortId; break; }}}
		if (portId == null) {System.out.println("Could not find COM port."); return;}
		try {//open serialport&use classname for appName.
          serialPort = (SerialPort) portId.open(this.getClass().getName(),TIME_OUT);
		     // set port parameters
		     serialPort.setSerialPortParams(DATA_RATE,SerialPort.DATABITS_8,SerialPort.STOPBITS_1,SerialPort.PARITY_NONE);
			// open the streams
			input = new BufferedReader(new InputStreamReader(serialPort.getInputStream()));
			output = serialPort.getOutputStream();
			// add event listeners
			serialPort.addEventListener(this);
			serialPort.notifyOnDataAvailable(true);
		    } catch (Exception e) {System.err.println(e.toString());}
	}

	/**
	 * This should be called when you stop using the port.
	 * This will prevent port locking on platforms like Linux.
	 */
	public synchronized void close() {
		if (serialPort != null) {
			serialPort.removeEventListener();
			serialPort.close();
		}
	}

	/**
	 * Handle an event on the serial port. Read the data and print it.
	 */
	public synchronized void serialEvent(SerialPortEvent oEvent) {
		if (oEvent.getEventType() == SerialPortEvent.DATA_AVAILABLE) {
			try {
				String inputLine=input.readLine();
				//System.out.println("Hello "+inputLine);
        if(ajdbc.ajs(inputLine))
        {System.out.println("Sucessfull");}
        else{System.out.println("Failed");}
        //send-data-to-dbfunction
			} catch (Exception e) {
				System.err.println(e.toString());
			}
		}
		// Ignore all the other eventTypes, but you should consider the other ones.
	}

	public static void main(String[] args) throws Exception
        {       Dbx main = new Dbx();
		main.initialize();
		Thread t=new Thread() {
			public void run() {
				//the following line will keep this app alive for 1000 seconds,
				//waiting for events to occur and responding to them (printing incoming messages to console).
				try {Thread.sleep(1000000);} catch (InterruptedException ie) {}
			}
		};
	  	t.start();
		System.out.println("Started");
	}
}
