private
configShort: index
	self longAt: 0 put: (self translate: index).
	^ self shortAt: 4 + (index bitAnd: 2) 