commands
enableIRQ: aNumber
	aNumber > 7
		ifTrue: [
			slave enableIRQ: aNumber - 8.
			self enableIRQ: 2]
		ifFalse: [
			savedMask := savedMask bitClear: 1 << aNumber.
			self byteAt: 1 put: savedMask].

"	Transcript cr; show: 'IRQ #', aNumber printString, ' enabled. Mask: ',savedMask printStringHex
"