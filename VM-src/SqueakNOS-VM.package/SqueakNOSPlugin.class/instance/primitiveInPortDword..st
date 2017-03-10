port i/o
primitiveInPortDword: portNumber
	| answer |

	self primitive: 'primitiveInPortDword'
		parameters: #(SmallInteger).

	self var: #answer type: 'unsigned int'.

	self cCode: 'asm("in %1, %0" : "=a" (answer) : "d" ((unsigned short)portNumber))'. 
	^ interpreterProxy positive32BitIntegerFor: answer