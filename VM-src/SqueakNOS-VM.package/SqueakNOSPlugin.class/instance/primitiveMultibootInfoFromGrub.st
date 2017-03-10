lock memory addresses
primitiveMultibootInfoFromGrub
	| mbi |
	self primitive: 'primitiveMultibootInfoFromGrub'
		parameters: #().

	self cCode: 'extern Computer computer'.
	self var: 'mbi' type: 'usqInt'.
	
	self cCode: 'mbi = computer.mbi'.

	^ mbi asSmallIntegerObj.
