device protocol
close
	super close.
	self fifoControlRegister: 0
	