irq handling
handleMouseIRQ
	| data |
	data := self readMouseData.

	"self mouseScrollingEnabled
			ifTrue:  [Keys1 add: 'Number ', mouseDataCount asString, ' data ', data asString, '
'. ]."
			
	mouseDataCount == 0 ifTrue: [ "button state"
		mouseDataCount := mouseDataCount + 1.
		^ modifiersAndButtons := (((modifiersAndButtons bitClear: 16r7)
			bitOr: (data bitAnd: 2))
			bitOr: (data bitAnd: 1) << 2)
			bitOr: (data bitAnd: 4) >> 2].

	data >= 16r80 ifTrue: [data := data - 16r100].

	mouseDataCount == 1 ifTrue: [ "x delta "
		mouseDataCount := mouseDataCount + 1.
		^ mouseCoord := data @ 0 + mouseCoord].

	
	mouseDataCount = 2 ifTrue: [ " y delta "
		mouseCoord := mouseCoord  - (0 @ data) adhereTo: Display boundingBox.
		].

	self mouseScrollingEnabled
			ifTrue:  [
				mouseDataCount = 2 ifTrue: [^mouseDataCount := mouseDataCount + 1.] ]
			ifFalse:[
				mouseDataCount := 0.
				^self newMouseEvent].
	
	" mouseDataCount == 3: z delta "
	mouseDataCount := 0.
	data < 0 ifTrue:["Scrolling up"
		^self newKeyboardControlCharEvent: Character arrowUp].
	data > 0 ifTrue:["Scrolling down"
		^self newKeyboardControlCharEvent: Character arrowDown].
	self newMouseEvent.