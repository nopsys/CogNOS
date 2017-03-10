translation
shiftTranslation: scanCode
	scanCode = 16r2A & (prevScanCode ~= 16rE0) ifTrue: ["left shift"	^ 8].
	scanCode = 16r36 & (prevScanCode ~= 16rE0) ifTrue: ["right shift"	^ 8].
	scanCode = 16r38 ifTrue: ["left ALT (command key)"	^ 16r40].
	scanCode = 16r1D ifTrue: ["left CTRL"	^ 16r10].

"	Transcript show: scanCode hex; space."
	^ 0