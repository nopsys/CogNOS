port i/o
primitiveInPortByte: portNumber
	| answer |

	self primitive: 'primitiveInPortByte'
		parameters: #(SmallInteger).

	self var: #answer type: 'unsigned char'.

	self cCode: 'asm("in %1, %0" : "=a" (answer) : "d" ((unsigned short)portNumber))'. 
	^ answer asSmallIntegerObj
