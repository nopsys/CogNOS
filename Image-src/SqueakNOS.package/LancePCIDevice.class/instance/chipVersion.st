as yet unclassified
chipVersion
	self controlStatusAddress: 88.
	self controlStatusAddress ~= 88 ifTrue: [^ 0].	" version 0 does not reflect addresses "

	^ (self controlStatusWord: 89) << 16 + (self controlStatusWord: 88)