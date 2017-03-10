as yet unclassified
remotePerform: aSelector withArguments: arguments
	| strm |
	strm := WriteStream on: ''.
	strm nextPut: ${.
	arguments do: [:each |
		strm
			store: each;
			nextPut: $ ;
			nextPut: $.].

	^ self remotePerform: aSelector withString: strm contents allButLast, '}'

