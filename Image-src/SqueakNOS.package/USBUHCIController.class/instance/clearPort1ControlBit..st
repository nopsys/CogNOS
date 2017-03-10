accessing - port status/controll
clearPort1ControlBit: bit
	^ self port1StatusControl: (self port1StatusControl bitClear: 1 << bit)