private
configLong: index
	self longAt: 0 put: (self translate: index).
	^ self longAt: 4 