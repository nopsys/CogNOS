as yet unclassified
performNext
	"server side"
	| strm object selector arguments answer |
	strm := self stream.

	[strm next = $> asciiValue] whileFalse.

	object := strm int32.
	selector := strm string asSymbol.
	arguments := strm string.

	object := self objectForHandle: object.
	arguments := Compiler evaluate: arguments.

	[	answer :=object perform: selector withArguments: arguments.
		answer := answer == object
			ifTrue: [#self]
			ifFalse: [answer storeString].
	]	ifError: [:msg :receiver | answer := 'Error signal: ', msg storeString].

	strm
		nextPut: $<;
		int32: answer size;
		nextPutAll: answer;
		flush.
