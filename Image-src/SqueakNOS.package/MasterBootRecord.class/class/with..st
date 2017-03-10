as yet unclassified
with: anArray
	anArray size ~= 512 ifTrue: [self error: 'Not a Master Boot Record'].
	^self new bytes: anArray.