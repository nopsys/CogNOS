initialization
testGetDeviceDescriptor
	| qh tdSetup tdData tdStatus buf |
	self enablePort1Reset.
	(Delay forMilliseconds: 10) wait.
	self disablePort1Reset.
	self enablePort1.
	self clearPort1ConnectStatusChange; clearPort1EnableStatusChange.

	qh := USBQueueHead externalNew.
	tdSetup := USBTransferDescriptor externalNew.
	tdData := USBTransferDescriptor externalNew.
	tdStatus := USBTransferDescriptor externalNew.
	buf := ExternalAddress allocate: 2000.

	qh beTerminator; beEmpty; next: qh.

	1 to: 1024 do: [:i | self frameListAt: i put: qh].

	tdSetup next: tdData.
	tdData next: tdStatus.

	tdSetup beData0; beSetup; activate; errorCount: 3; bufferPointer: buf asInteger; enableInterruptOnComplete.
	tdData beData1; beInput; activate; errorCount: 3; bufferPointer: buf asInteger; enableInterruptOnComplete.
	tdStatus beData1; beOutput; activate; errorCount: 3; beTerminator; enableInterruptOnComplete.

	tdSetup maxLength: 8.
	tdData maxLength: 1000.

	buf
		byteAt: 1 put: 16r80;		" Input. Standard. Device "
		byteAt: 2 put: 6;			" GET_DESCRIPTOR "
		unsignedByteAt: 3 put: 0;	" wValue: idx"
		unsignedByteAt: 4 put: 1;	" wValue: DEVICE"
		unsignedShortAt: 5 put: 0;
		unsignedShortAt: 7 put: 18.

	qh first: tdSetup.

	^ Array with: qh with: buf.