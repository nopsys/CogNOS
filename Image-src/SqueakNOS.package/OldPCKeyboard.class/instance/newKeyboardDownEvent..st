irq handling
newKeyboardDownEvent: aCharacter
	self newKeyboardEvent: aCharacter type: EventKeyDown.
	self newKeyboardEvent: aCharacter type: EventKeyChar.
