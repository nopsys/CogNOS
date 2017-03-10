as yet unclassified
altGrPressedIn: aModifiersRegister
	^(aModifiersRegister bitAnd: 16r40) > 0 and: [(aModifiersRegister bitAnd: 16r10 ) > 0 ].