irq handling
handleKeyboardIRQ
	| scanCode key |
	scanCode := self readKeyboardData.

	decoder nextScanCode: scanCode.
	
	decoder nextKeyReady ifFalse: [^self].
	
	decoder isModifier
		ifFalse: [ "it's an ascii caracter"
			key := decoder keyUsing: keysMapping modifiers: modifiersAndButtons.
			key asciiValue = 0 ifTrue: [^self].
			decoder isKeyUp 
				ifTrue: [ self newKeyboardUpEvent: key ]
				ifFalse: [ self newKeyboardDownEvent: key].
		]
		ifTrue: [ " it's a modifier "
			"modifiersAndButtons := modifiersAndButtons bitXor: decoder translateModifierScanCode."
			
			decoder isKeyUp
				ifTrue: [ modifiersAndButtons := modifiersAndButtons bitClear: decoder translateModifierScanCode ]
				ifFalse: [ modifiersAndButtons := modifiersAndButtons bitOr: decoder translateModifierScanCode ].
		].
		
	

