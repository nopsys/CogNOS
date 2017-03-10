private
configByte: index
	self longAt: 0 put: (self translate: index).
	^ self byteAt: 4 + (index bitAnd: 3) 