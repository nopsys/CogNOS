mouse commands
auxWriteAndWaitAck: aByte
	self auxWrite: aByte.
	^self waitData = 16rFA