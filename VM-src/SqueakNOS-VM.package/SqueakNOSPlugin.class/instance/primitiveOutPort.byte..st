port i/o
primitiveOutPort: portNumber byte: byte

	self primitive: 'primitiveOutPortByte'
		parameters: #(SmallInteger SmallInteger).

	self cCode: 'asm("out %0, %1" :: "a" ((unsigned char)byte), "d" ((unsigned short)portNumber))'
