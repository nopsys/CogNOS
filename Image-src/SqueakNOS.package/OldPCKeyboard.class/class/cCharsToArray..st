system startup
cCharsToArray: aString
	| strm table |
	strm := ReadStream on: aString.
	strm reset.
	table := OrderedCollection new: 128.
	[strm atEnd]
		whileFalse: [strm peek = $\
				ifTrue: 
					[strm next.
					strm peek isDigit
						ifTrue: [table add: (Character value: ('8r' , (strm next: 3)) asNumber)]
						ifFalse: [table add: (self unescapeCharacter: strm next)]]
				ifFalse: [table add: strm next]].
	^ table asArray