accessing - link pointer
next
	self isTerminator ifTrue: [^ nil].
	self nextIsQueueHead
		ifTrue: [^ USBQueueHead fromHandle: self nextAddress]
		ifFalse: [^ USBTransferDescriptor fromHandle: self nextAddress]
	