accessing - port status/controll
port2LineStatus
	^(self testPort2StatusBit: 5) * 2 + (self testPort2StatusBit: 4)