translation
extendedTranslation: scanCode
	scanCode = 75 ifTrue: [^Character value: 28].
	scanCode = 77 ifTrue: [^Character value: 29].
	scanCode = 72 ifTrue: [^Character value: 30].
	scanCode = 80 ifTrue: [^Character value: 31].
	scanCode = 71 ifTrue: [^Character value: 1].
	scanCode = 79 ifTrue: [^Character value: 4].
	scanCode = 73 ifTrue: [^Character value: 11].
	scanCode = 81 ifTrue: [^Character value: 12].
	^ Character value: 0
