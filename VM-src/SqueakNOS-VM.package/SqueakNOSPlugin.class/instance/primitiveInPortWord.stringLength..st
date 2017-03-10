port i/o
primitiveInPortWord: port stringLength: length
	| dataOop dataPtr |

	self primitive: 'primitiveInPortWordStringLength'
		parameters: #(SmallInteger SmallInteger).

	self var: #dataPtr type: 'unsigned char *'.
	dataOop := interpreterProxy instantiateClass: interpreterProxy classString indexableSize: length.
	dataPtr := interpreterProxy firstIndexableField: dataOop.

	self cCode: 'asm("rep insw"
		:
		: "d" ((unsigned short)port),
		  "c" ((unsigned int) (length >> 1)),
		  "D" (dataPtr)
		)'. 

	^ dataOop