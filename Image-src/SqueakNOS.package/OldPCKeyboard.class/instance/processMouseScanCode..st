irq handling
processMouseScanCode: aByte
	| scanCode |
	scanCode := aByte.
	mouseCount := mouseCount + 1.
	mouseCount = 1 ifTrue: [ "button state"
		buttonsState := (((buttonsState bitClear: 7)
			bitOr: (scanCode bitAnd: 2))
			bitOr: (scanCode bitAnd: 1) << 2)
			bitOr: (scanCode bitAnd: 4) >> 2.].
	mouseCount = 2 ifTrue: [ "x delta"	
		scanCode > 127 ifTrue: [scanCode := scanCode - 256].
		self hideCursor.
		self mousePoint: scanCode @ 0 + mousePoint].
	mouseCount = 3 ifTrue: [ "y delta"
		scanCode > 127 ifTrue: [scanCode := scanCode - 256].
		self mousePoint: mousePoint - (0 @ scanCode).
		mouseCount := 0.
		self showCursor].
	self newMouseEvent