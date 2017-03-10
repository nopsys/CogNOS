initialization
initialize
	| rbuf |
	0 to: 3 do: [:i |
		self transmitStartAddress: i put: (ExternalAddress allocate: 1536 aligned: 4).
		self transmitStatus: i put: 2r10000000000000	"belogning to host, don't send"].
	
	rbuf := ExternalAddress allocate: 64*1024+16 aligned: 4.
	nextTxIndex := 0.
	self
		reset;
		receiveBufferAddress: rbuf;
		receiveReadOffset: 16rFFF0;
		interruptMask: 2r1110000001111111;		"enable all IRQs. needed because the status must be cleared"
		command: 12;							"enable receive, enable transmit"
		receiveConfiguration: 2r1111111001011110;	"receive everything except non-matching MAC"
		transmitConfiguration: 2r00000011000000000000011011110000.