squeakNOS primitives
primOpenPort: portNumber baudRate: baud stopBitsType: stop
	parityType: parityType dataBits: numDataBits
	inFlowControlType: inFlowCtrl outFlowControlType: outFlowCtrl
	xOnByte: xOn xOffByte: xOff
	self openPort: portNumber