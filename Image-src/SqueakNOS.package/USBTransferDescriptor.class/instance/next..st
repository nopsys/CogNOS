accessing - link pointer
next: usbQHorTD
	| address |
	address := usbQHorTD address asInteger.
	(address anyMask: 2r1111) ifTrue: [self error: 'Elements must be aligned to 16'].
	usbQHorTD isQueueHead ifTrue: [address := address bitOr: 2r10].	" turn on Q bit. "
	self isDepthFirst ifTrue: [address := address bitOr: 2r100].			" maintain Vf "
	self linkPointerVQT: address.	" clear Terminator "
