accessing - noauto
logicalAddressFilter: a64BitsInteger
	self ladrf0: (a64BitsInteger bitAnd: 16rFFFFFFFF).
	self ladrf1: (a64BitsInteger >> 32 bitAnd: 16rFFFFFFFF).

