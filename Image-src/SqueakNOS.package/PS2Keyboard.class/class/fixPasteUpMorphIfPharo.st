class initialization
fixPasteUpMorphIfPharo
	SmalltalkImage current isPharo ifFalse: [^self].
	PasteUpMorph compile:
	'morphsInFrontOf: someMorph overlapping: aRectangle do: aBlock
	"Include hands if the receiver is the World"
	self handsDo:[:m|
		m == someMorph ifTrue:[ "Try getting out quickly"
			owner ifNil:[^self].
			^owner morphsInFrontOf: self overlapping: aRectangle do: aBlock
		]
	].
		
	^super morphsInFrontOf: someMorph overlapping: aRectangle do: aBlock'
		classified: 'submorphs-accessing'.
		