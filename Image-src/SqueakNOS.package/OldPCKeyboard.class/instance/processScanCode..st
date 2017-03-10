irq handling
processScanCode: scanCode
	| key code |
	scanCode = 0 | (scanCode = 16rFF)	" extended keys "
		ifTrue: 
			[prevScanCode := 0.
			^ self].
	(scanCode anyMask: 16r80)
		ifTrue: "key up"
			[scanCode = 16rE0 | (scanCode = 16rE1)	" special keys (SysReq) "
				ifTrue: 
					[prevScanCode := scanCode.
					^ self].
			code := scanCode bitClear: 16r80.
			(key := self simpleTranslation: code) asciiValue = 0
				ifTrue: [buttonsState := buttonsState bitClear: (self shiftTranslation: code)]
				ifFalse: [self newKeyboardUpEvent: key].
			prevScanCode := scanCode.
			^ self]
		ifFalse: "key down"
			[prevScanCode = 16rE0
				ifTrue: [key := self extendedTranslation: scanCode]
				ifFalse: 
					[key := self shiftPressed
								ifTrue: [self shiftedTranslation: scanCode]
								ifFalse: [self simpleTranslation: scanCode].
					key asciiValue = 0
					 ifTrue: [buttonsState := buttonsState bitOr: (self shiftTranslation: scanCode)]].
				key asciiValue = 0 ifFalse: [self newKeyboardDownEvent: key]. 
				prevScanCode := 0].

