irq handling
newKeyboardEvent: aCharacter type: byteType
	" taken from EventSensor >> #nextEventSynthesized "
	event
		at: 1 put: EventTypeKeyboard; "evt type"
		at: 2 put: Time millisecondClockValue; "time stamp"
		at: 3 put: aCharacter asciiValue; "char code"
		at: 4 put: byteType; "key press/release"
		at: 5 put: buttonsState >> 3. "modifier keys"

	Sensor processEvent: event.
	self report: event.