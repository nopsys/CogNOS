as yet unclassified
remotePerform: aSelector withString: argumentsString
	| answer |
	self stream
		nextPut: $>;	" query "
		int32: self handle;
		string: aSelector;
		string: argumentsString;
		flush.

	[self stream next = $< asciiValue] whileFalse.

	answer := (self stream next: self stream int32) asString.
	^ answer = 'self' ifTrue: [self object] ifFalse: [Compiler evaluate: answer].
