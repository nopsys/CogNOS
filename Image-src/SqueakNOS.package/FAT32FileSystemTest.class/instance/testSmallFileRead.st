as yet unclassified
testSmallFileRead
	| filesystem root ascii |
	filesystem := self newInstance.
	root := filesystem root.
	ascii := root fileNamed: 'ascii'.
	self assert: ascii readStream contents asString withBlanksTrimmed asLowercase = 'zaraza'.