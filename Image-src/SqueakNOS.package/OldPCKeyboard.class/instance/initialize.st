initialization
initialize
	| auxPortPresent |
	super initialize.
	pressedKeys := SharedQueue new.
	event := Array new: 8.
	mousePoint := 320 @ 320.
	buttonsState := 0.
	mouseCount := 2.
	prevScanCode := 0.
	underCursorForm := nil.
	lastScanCode := 0.
	self clearInput.

	self setMode: 0.
	self initializeHardware.

	(auxPortPresent := true "self isAuxPortPresent") ifTrue: [
		self report: 'Detected PS/2 Mouse port'.
		self initializeAux].
	self setInitialMode: auxPortPresent
