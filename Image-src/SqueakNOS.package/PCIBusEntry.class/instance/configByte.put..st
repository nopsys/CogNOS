private
configByte: index put: aNumber
	self longAt: 0 put: (self translate: index).
	^ self byteAt: 4 + (index bitAnd: 3) put: aNumber