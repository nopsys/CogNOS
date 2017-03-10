processor registers
primitivePutIn32bitRegisterCr3
	"Store an unsigned integer into the CR3 register"
	"primitivePutIn32bitRegisterCr3: aStatusWord <Integer>"

	| aStatusWord | 
	self export: true.
	self var: aStatusWord type: 'long'.
	aStatusWord := interpreterProxy positive32BitValueOf: (interpreterProxy stackValue: 0).
	interpreterProxy failed ifTrue:
		[^interpreterProxy primitiveFailFor: 0].
	interpreterProxy pop: 1.
	self cCode: 'asm("movl %0, %%cr3" :: "g" (aStatusWord) )'