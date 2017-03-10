initialization
numberFromString: str
	| strm head base |
	strm := ReadStream on: str asUppercase.
	strm peekFor: $".
	head := strm next: 2.
	head size > 1
		ifTrue: [
			base := 10.
			head = '0X'
				ifTrue: [base := 16]
				ifFalse: [
					head = '&#' ifFalse: [strm skip: -2]]]
		ifFalse: [strm skip: -1].
	^ [Number readFrom: strm base: base] ifError: [0]