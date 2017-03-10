irq handling
newMouseEvent
	| modifiers buttons mapped |
	modifiers := buttonsState bitShift: -3.
	buttons := buttonsState bitAnd: 7.
	mapped := Sensor mapButtons: buttons modifiers: modifiers.
	event
		at: 1 put: EventTypeMouse;
		at: 2 put: Time millisecondClockValue;
		at: 3 put: mousePoint x;
		at: 4 put: mousePoint y;
		at: 5 put: mapped;
		at: 6 put: modifiers.
	Sensor processEvent: event.
	self report: event.