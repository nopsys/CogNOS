irq handling
newKeyboardControlCharEvent: char
	modifiersAndButtons  := (modifiersAndButtons  bitOr: 16r10).
	self newKeyboardEvent: char type: EventKeyChar.
	modifiersAndButtons := modifiersAndButtons bitClear: 16r10.
