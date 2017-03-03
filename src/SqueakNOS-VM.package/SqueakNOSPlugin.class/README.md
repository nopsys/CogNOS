This class implements the few needed primitives for running SqueakNOS.

primitiveInPortByte: portNumber					'primitiveInPortByte'
primitiveOutPort: portNumber byte: byte			'primitiveOutPortByte'
primitiveInPortWord: portNumber				'primitiveInPortWord'
primitiveOutPort: portNumber word: word		'primitiveOutPortWord'
primitiveInPortDword: portNumber				'primitiveInPortDword'
primitiveOutPort: portNumber dword: dword		'primitiveOutPortDword'

primitiveReadStringLength: length fromMemoryAt: address
												'primitiveReadStringLengthFromMemoryAt'
primitiveWriteString: aString toMemoryAt: address
												'primitiveWriteStringToMemoryAt'

primitiveRegisterSemaphoreIndex: aSemaphoreIndex forIRQ: irqNumber
												'primitiveRegisterSemaphoreIndexForIRQ'