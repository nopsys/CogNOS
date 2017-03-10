initialization
initialize
	super initialize.
	baudRate := 57600. "tried 115200 but doesn't work on my vmware at least"
	stopBits := 1.
	parity := 0.
	dataBits := 8