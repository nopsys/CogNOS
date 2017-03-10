accessing - port status/controll
setPort2ControlBit: bit
	^ self port2StatusControl: (self port2StatusControl bitOr: 1 << bit)
