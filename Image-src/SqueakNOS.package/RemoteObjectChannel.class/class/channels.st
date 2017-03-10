as yet unclassified
channels
	"only used in server's side.
	In client side there is no need to mantain the Dictionary, as every Channel knows its handle"
	^ Channels ifNil: [
		Channels := Dictionary new
			at: 0 put: (self new
				handle: 0;
				object: self;
				stream: self stream);
			yourself.
		]