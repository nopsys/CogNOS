private
configLong: index put: aNumber
	self longAt: 0 put: (self translate: index).
	^ self longAt: 4 put: aNumber