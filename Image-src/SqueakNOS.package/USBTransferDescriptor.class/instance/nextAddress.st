accessing - link pointer
nextAddress
	^ ExternalAddress new fromInteger: (self linkPointerVQT bitClear: 2r1111).