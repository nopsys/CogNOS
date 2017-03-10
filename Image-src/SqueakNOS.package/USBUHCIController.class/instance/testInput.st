initialization
testInput
	| td buf |
	td := USBTransferDescriptor externalNew.
	buf := ExternalAddress allocate: 1500.
	td bufferPointer: buf asInteger.
	td beInput.
	td maxLength: 1280.
	td errorCount: 3.
	td enableInterruptOnComplete.
	td beTerminator.
	td activate.
	self frameListAt: 100 put: td.
	^ Array with: td with: buf.
