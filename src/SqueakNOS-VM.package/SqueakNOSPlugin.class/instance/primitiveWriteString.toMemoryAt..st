string i/o
primitiveWriteString: aString toMemoryAt: address
	| length |
	self primitive: 'primitiveWriteStringToMemoryAt'
		parameters: #(String SmallInteger).

	length := interpreterProxy slotSizeOf: aString cPtrAsOop.
	self cCode: 'memcpy((void*)address, aString, length)'.
