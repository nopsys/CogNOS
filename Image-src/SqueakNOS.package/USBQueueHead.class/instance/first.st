accessing
first
	self isEmpty ifTrue: [^ nil].
	self firstIsQueueHead
		ifTrue: [^ USBQueueHead fromHandle: self firstAddress]
		ifFalse: [^ USBTransferDescriptor fromHandle: self firstAddress]