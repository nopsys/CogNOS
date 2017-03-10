accessing - frame list
frameListAt: index
	(self isTerminatorAt: index) ifTrue: [^nil].
	^ (self isPointingToQueueHeadAt: index) 
		ifTrue: [USBQueueHead fromHandle: (self frameListAddressAt: index)]
		ifFalse: [USBTransferDescriptor fromHandle: (self frameListAddressAt: index)]