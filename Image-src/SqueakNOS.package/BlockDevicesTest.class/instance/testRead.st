as yet unclassified
testRead
	| ba value |
	ba := ByteArray new: 4.
	value := -1.
	self shouldnt: [ba longAt: 1 put: value bigEndian: true] raise: Error.
	self assert: (ba longAt: 1 bigEndian: true) = value.
	self shouldnt: [ba longAt: 1 put: value bigEndian: false] raise: Error.
	self assert: (ba longAt: 1 bigEndian: false) = value.