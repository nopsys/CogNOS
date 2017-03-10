initialization
testGetStringDescriptor: idx
	| td buf |
	td := USBTransferDescriptor externalNew.
	buf := ExternalAddress allocate: 1280.
	td bufferPointer: buf asInteger.
	td packetIdentification: 16r2D.
	td maxLength: 1280.
	td errorCount: 3.
	td activate.
	buf
		byteAt: 1 put: 16r80;			" bmRequestType: Direction=Device to Host | Type=Standard | Recipient=Device "
		byteAt: 2 put: 6;				" bRequest: GET_DESCRIPTOR "
		unsignedByteAt: 3 put: idx;	" wValue: idx"
		unsignedByteAt: 4 put: 3;	" wValue: STRING"
		unsignedShortAt: 5 put: 0;	" wIndex: LANGUAGE"
		unsignedShortAt: 7 put: 1000." wLength: 1000 "
	self frameListAt: 90 put: td.
	^ Array with: td with: buf.
