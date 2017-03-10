accessing
as83Format: aString
	| index name extension |
	index := aString findFirst: [:char | char = $.].
	name := index > 7 ifTrue: [aString first: 8] ifFalse: [(aString first: index - 1) , ((String new: 8 - index + 1) atAllPut: $ ) ].
	extension := aString size - index > 3 ifTrue: [aString copyFrom: index + 1 to: index + 3] ifFalse: [(aString copyFrom: index + 1 to: aString size) , ((String new: 3 - (aString size - index)) atAllPut: $ ) ].
	^name , extension. 