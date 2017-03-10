as yet unclassified
onPCIEntry: aPCIBusEntry computer: aComputer
	| answer |
	answer := self onPort: aPCIBusEntry allIORanges first key.

	aPCIBusEntry
		enableBusMastering;
		enableIO;
		" enable IRQ routing (legacy support)"
		configShort: 16rC0 put: ((aPCIBusEntry configShort: 16rC0) bitOr: 1 << 13).

	" copyed from GRUB, not sure if needed or not:"
	aPCIBusEntry latencyTimer < 32 ifTrue: [aPCIBusEntry latencyTimer: 32].

	aComputer interruptController
		addHandler: answer
		forIRQ: aPCIBusEntry interruptLine.

	aComputer usbUHCIController: answer.
	^ answer

