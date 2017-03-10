accessing - port status/controll
testPort2StatusBit: bit
	^ self port2StatusControl anyMask: 1 << bit
