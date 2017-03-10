as yet unclassified
newHandle
	| answer |
	[answer := SmallInteger maxVal atRandom.
	self channels includesKey: answer] whileTrue.
	^ answer