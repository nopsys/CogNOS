accessing
logicalAddressFilter
	^ (self longAt: 16rC) << 32 + (self longAt: 8)