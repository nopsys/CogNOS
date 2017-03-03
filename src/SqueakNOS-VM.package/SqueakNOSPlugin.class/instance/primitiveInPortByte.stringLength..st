port i/o
primitiveInPortByte: port stringLength: length
	| dataOop dataPtr |

	self primitive: 'primitiveInPortByteStringLength'
		parameters: #(SmallInteger SmallInteger).

	self var: #dataPtr type: 'unsigned char *'.
	dataOop := interpreterProxy instantiateClass: interpreterProxy classString indexableSize: length.
	dataPtr := interpreterProxy firstIndexableField: dataOop.

	self cCode: 'asm("rep insb"
		: 
		: "d" ((unsigned short)port),
		  "c" ((unsigned int) length),
		  "D" (dataPtr)
		)'. 

	^ dataOop
