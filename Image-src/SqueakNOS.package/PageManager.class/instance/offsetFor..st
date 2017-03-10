translation-private
offsetFor: anAddress
	^anAddress bitAnd: 16r00000FFF.
	