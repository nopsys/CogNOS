FIFO control
disableFIFO
	fifoStatus := fifoStatus bitClear: 1.
	self fifoControlRegister: fifoStatus.