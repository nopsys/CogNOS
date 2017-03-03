port i/o
primitiveOutPort: portNumber dword: dwordOop
	| dword |
	self primitive: 'primitiveOutPortDword'
		parameters: #(SmallInteger Oop).

	dword := interpreterProxy positive32BitValueOf: dwordOop.
	interpreterProxy failed ifTrue: [^nil].
	self cCode: 'asm("out %0, %1" :: "a" (dword), "d" ((unsigned short)portNumber))'
