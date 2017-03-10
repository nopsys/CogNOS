FIFO control
resetInputQueue
	self fifoControlRegister: (fifoStatus bitOr: 2).