port i/o
primitiveOutPort: port dwordString: aString
	| length |

	self primitive: 'primitiveOutPortDwordString'
		parameters: #(SmallInteger String).

	self var: #length type: 'unsigned int'.
	length := (interpreterProxy slotSizeOf: aString cPtrAsOop) >> 2.

	self cCode: 'asm("rep outsl"
		: 
		: "d" ((unsigned short)port),
		  "c" ((unsigned int) length),
		  "S" (aString)
		)'. 
