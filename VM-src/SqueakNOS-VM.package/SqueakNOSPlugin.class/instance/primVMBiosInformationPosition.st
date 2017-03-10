lock memory addresses
primVMBiosInformationPosition
	| start |
	self primitive: 'primVMBiosInformationPosition'
		parameters: #().

	self cCode: 'extern Computer computer'.
	self var: 'start' type: 'usqInt'.
	
	self cCode: 'start = &computer'.

	^ start asSmallIntegerObj.
