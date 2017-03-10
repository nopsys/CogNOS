device protocol
open
	receivedChars := SharedQueue new.
	self setBaudRate: baudRate.
	self
		initializeLineControlRegisterStopBitsType: stopBits
		parityType: parity
		dataBits: dataBits.
	self byteAt: 0.
	self readLineStatus.
	self readModemStatus.
	self modemControlRegister: 16r0B.
	self interruptEnableRegister: 16r09.
	self interruptIDRegister