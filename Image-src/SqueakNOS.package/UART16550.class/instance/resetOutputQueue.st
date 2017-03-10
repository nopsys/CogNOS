FIFO control
resetOutputQueue
	self fifoControlRegister: (fifoStatus bitOr: 4).