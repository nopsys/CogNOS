system startup
detectedUARTS
	| uart |
	^#(16r3F8 16r2F8 16r3E8 16r2E8)
		collect: [:portNumber |
			uart := self onPort: portNumber.
			uart exists ifTrue: [uart] ifFalse: [nil]].
