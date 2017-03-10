accessing - port status/controll
clearPort2ControlBit: bit
	^ self port2StatusControl: (self port2StatusControl bitClear: 1 << bit)