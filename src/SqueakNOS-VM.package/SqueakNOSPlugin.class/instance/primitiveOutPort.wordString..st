port i/o
primitiveOutPort: port wordString: aString
	| length |

	self primitive: 'primitiveOutPortWordString'
		parameters: #(SmallInteger String).

	self var: #length type: 'unsigned int'.
	length := (interpreterProxy slotSizeOf: aString cPtrAsOop) >> 1.

	self cCode: 'asm("rep outsw"
		: 
		: "d" ((unsigned short)port),
		  "c" ((unsigned int) length),
		  "S" (aString)
		)'. 
