port i/o
primitiveOutPort: port byteString: aString
	| length |

	self primitive: 'primitiveOutPortByteString'
		parameters: #(SmallInteger String).

	self var: #length type: 'unsigned int'.
	length := interpreterProxy slotSizeOf: aString cPtrAsOop.

	self cCode: 'asm("rep outsb"
		: 
		: "d" ((unsigned short)port),
		  "c" ((unsigned int) length),
		  "S" (aString)
		)'. 
