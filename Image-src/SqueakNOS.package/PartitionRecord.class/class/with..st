as yet unclassified
with: anArray
	anArray size ~= 16 ifTrue: [self error: 'Not a Partition Record'].
	^self new bytes: anArray.