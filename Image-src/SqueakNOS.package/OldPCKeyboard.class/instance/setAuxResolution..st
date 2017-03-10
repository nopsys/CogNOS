mouse commands
setAuxResolution: value
	self auxWriteAndWaitAck: 16rE8.
	self auxWriteAndWaitAck: value. 