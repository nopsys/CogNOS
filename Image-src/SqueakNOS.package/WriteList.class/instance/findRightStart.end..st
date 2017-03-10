as yet unclassified
findRightStart: startPosition end: endPosition
	| last |	
	blocksList withIndexDo: [ :elem :index |
		((elem at: 1) <= endPosition)
		  ifTrue: [
			last := index.
		] ifFalse: [
			^last.
		].
	].
	^last.

