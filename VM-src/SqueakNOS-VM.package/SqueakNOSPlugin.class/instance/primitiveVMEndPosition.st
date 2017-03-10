lock memory addresses
primitiveVMEndPosition
	| end |
	self primitive: 'primitiveVMEndPosition'
		parameters: #().

	self cCode: 'extern usqInt __end'.
	self var: 'end' type: 'usqInt'.
	
	self cCode: 'end = &__end'.

	^ end asSmallIntegerObj.
