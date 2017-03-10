port i/o
primitiveInPortDword: port stringLength: length
	| dataOop dataPtr |

	self primitive: 'primitiveInPortdWordStringLength'
		parameters: #(SmallInteger SmallInteger).

	self var: #dataPtr type: 'unsigned char *'.
	dataOop := interpreterProxy instantiateClass: interpreterProxy classString indexableSize: length.
	dataPtr := interpreterProxy firstIndexableField: dataOop.

	self cCode: 'asm("rep insl"
		: 
		: "d" ((unsigned short)port),
		  "c" ((unsigned int) (length >> 2)),
		  "D" (dataPtr)
		)'. 

	^ dataOop