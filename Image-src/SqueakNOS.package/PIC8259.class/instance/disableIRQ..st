commands
disableIRQ: aNumber
	aNumber > 7
		ifTrue: [
			slave disableIRQ: aNumber - 8.
			slave isAnyEnabled ifFalse: [self disableIRQ: 2]]
		ifFalse: [
			savedMask := savedMask bitOr: 1 << aNumber.
			self byteAt: 1 put: savedMask].

"	Transcript cr; show: 'IRQ #', aNumber printString, ' disabled. Mask: ',savedMask hex.
"