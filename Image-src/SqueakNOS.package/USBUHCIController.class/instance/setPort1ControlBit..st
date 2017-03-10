accessing - port status/controll
setPort1ControlBit: bit
	^ self port1StatusControl: (self port1StatusControl bitOr: 1 << bit)
