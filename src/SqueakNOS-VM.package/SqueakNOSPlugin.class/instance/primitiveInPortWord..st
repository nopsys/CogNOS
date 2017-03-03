port i/o
primitiveInPortWord: portNumber
	| answer |

	self primitive: 'primitiveInPortWord'
		parameters: #(SmallInteger).

	self var: #answer type: 'unsigned short'.

	self cCode: 'asm("in %1, %0" : "=a" (answer) : "d" ((unsigned short)portNumber))'. 
	^ answer asSmallIntegerObj
