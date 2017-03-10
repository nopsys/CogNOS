accessing - command register
hasSpecialCycleEnabled
	"bit 3 - Controls a device's action on Special Cycle operations. A value of 0
	causes the device to ignore all Special Cycle operations. A value of 1
	allows the device to monitor Special Cycle operations. State after
	RST# is 0."

	^ self testCommandBit: 3