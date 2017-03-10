as yet unclassified
channel
	channel
		ifNil: [channel := RemoteObjectChannel for: self using: 'MultiByteFileStream new'].
	^ channel