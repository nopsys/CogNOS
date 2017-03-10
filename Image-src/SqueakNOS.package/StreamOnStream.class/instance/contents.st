accessing
contents
	| contents  pos |
	pos := self position.
	self position: 0.
	contents := self next: self size.
	self position: pos.
	^contents