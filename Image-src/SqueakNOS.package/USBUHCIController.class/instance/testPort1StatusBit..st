accessing - port status/controll
testPort1StatusBit: bit
	^ self port1StatusControl anyMask: 1 << bit
