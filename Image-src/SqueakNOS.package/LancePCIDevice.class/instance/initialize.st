as yet unclassified
initialize
	| initBlock tring rring rbuf tbuf |

	rbuf := ExternalAddress allocate: 1536.
	rring := (LanceNICReceiveRingDescriptor16 externalNewAligned: 8)
		reset;
		buffer: rbuf;
		bufferSize: 1536;
		messageSize: 0;
		beOwnedByCard.

	tbuf := ExternalAddress allocate: 1536.
	tring := (LanceNICTransmitRingDescriptor16 externalNewAligned: 8)
		reset;
		buffer: tbuf;
		beOwnedByHost.
		
	initBlock := (LanceNICInitializationBlock16 externalNewAligned: 8)   
		mode: 0;		"auto media"
		macAddress: self macAddress;
		logicalAddressFilter: 0;
		transmitRing: tring;
		transmitRingLen: 0;
		receiveRing: rring;
		receiveRingLen: 0.

	self
		stop;
		initializationBlock: initBlock;
		testAndFeaturesControl: 2r0100111101111111;
		automaticMediaSelection;
		initAndStart.

	" 2r0100.1111.0111.1111 = (page 112 of Am79C790A pdf)
		0,1	No Jabber IRQ + reset Jabber flag.
		2,3	No Transmit Start IRQ + reset Transmit status.
		4,5	No Receive Collition Counter overflow IRQ + reset RCVCCO.
		6	Clear user interrupt flag.
		7	No User Interrupt Command.
		8,9	No Clear Missed Frame Counter overflow IRQ + clear MFCO.
		10	Auto Strip Receive Padding (may we want to see it?)
		11	Auto Pad Outgoing.
		12	No Disable Auto Transmit Polling
		13	No Enable Bus Timer
		14	Disable DMA Plus transfer counter.
		15	Disable EN124 (No Runt Packet Accept)
	"

	self enableInterrupts.