as yet unclassified
translateModifierScanCode

	| normalizedCode |
	
	previousScanCode = 16rE0 ifTrue: [^ 0]. "Is an extended scancode, can't be a modifier"
	
	normalizedCode := actualScanCode bitClear: 16r80.
	
	normalizedCode == 16r2A ifTrue: [^ 8].		" left shift "	
	normalizedCode == 16r36 ifTrue: [^ 8].		" right shift "
	normalizedCode == 16r38 ifTrue: [^ 16r40].	" left ALT (command key) "
	normalizedCode == 16r1D ifTrue: [^ 16r10].	" left CTRL "

	^ 0.