irq handling
newMouseEvent
	| modifiers buttons mapped event |
	modifiers := modifiersAndButtons bitShift: -3.
	buttons := modifiersAndButtons bitAnd: 7.
	mapped := Sensor mapButtons: buttons modifiers: modifiers.
	(event := Array new: 8)
		at: 1 put: EventTypeMouse;
		at: 2 put: Time millisecondClockValue;
		at: 3 put: mouseCoord x;
		at: 4 put: mouseCoord y;
		at: 5 put: mapped;
		at: 6 put: modifiers;
		at: 7 put: 0;
		at: 8 put: 1.
	events nextPut: event.
"	self report: event.
"