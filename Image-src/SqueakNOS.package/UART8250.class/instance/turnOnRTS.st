accessing
turnOnRTS
	self modemControlRegister: 
		(self modemControlRegister bitOr: 2r10).