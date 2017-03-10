accessing - port status/controll
port1LineStatus
	^(self testPort1StatusBit: 5) * 2 + (self testPort1StatusBit: 4)