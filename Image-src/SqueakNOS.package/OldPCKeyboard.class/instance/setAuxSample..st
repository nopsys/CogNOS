mouse commands
setAuxSample: value
	self auxWriteAndWaitAck: 16rF3.
	self auxWriteAndWaitAck: value. 