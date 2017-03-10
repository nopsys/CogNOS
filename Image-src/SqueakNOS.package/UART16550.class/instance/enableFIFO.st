FIFO control
enableFIFO
	fifoStatus := fifoStatus bitOr: 1.
	self fifoControlRegister: fifoStatus.