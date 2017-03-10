accessing
message: aString
	super message: aString.
	self
		bufferSize: aString size;
		startOfPacketSet;
		endOfPacketSet;
		beOwnedByCard.