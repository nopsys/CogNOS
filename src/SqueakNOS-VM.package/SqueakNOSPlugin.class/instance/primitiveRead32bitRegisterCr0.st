processor registers
primitiveRead32bitRegisterCr0
	| answer |
	self primitive: 'primitiveRead32bitRegisterCr0' parameters: #().
	self var: #answer type: 'unsigned long'.
	self cCode: 'asm("movl %%cr0, %0" : "=a" (answer) )'. 
	^interpreterProxy positive32BitIntegerFor: answer

