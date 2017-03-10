port i/o
primitiveOutPort: portNumber word: word

	self primitive: 'primitiveOutPortWord'
		parameters: #(SmallInteger SmallInteger).

	self cCode: 'asm("out %0, %1" :: "a" ((unsigned short)word), "d" ((unsigned short)portNumber))'
