processor registers
primitiveRead32bitRegisterCr3
	| answer |
	self primitive: 'primitiveRead32bitRegisterCr3' parameters: #().
	self var: #answer type: 'unsigned long'.
	self cCode: 'asm("movl %%cr3, %0" : "=a" (answer) )'. 
	^interpreterProxy positive32BitIntegerFor: answer
