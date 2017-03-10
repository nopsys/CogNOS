commands
signalEndOfInterrupt: interruptNumber
	interruptNumber > 7 ifTrue: [slave signalEndOfInterrupt: interruptNumber - 8].
	self byteAt: 0 put: 16r20.
"	Transcript cr; show: 'end of IRQ #', interruptNumber printString.
"