accessing
timerCount
	"TCTR - Timer Count Register: This register contains a 32-bit
	general-purpose timer. Writing any value to this 32-bit register will
	reset the original timer and begin to count from zero."
	^ self longAt: 16r48
