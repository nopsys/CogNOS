as yet unclassified
testLastPositionInSameBlock

	| helper |
	helper := BlockArithmetic new size: 512.

	self assert: (helper lastPositionInSameBlockOf: 1) = 512.
	self assert: (helper lastPositionInSameBlockOf: 2) = 512.
	self assert: (helper lastPositionInSameBlockOf: 300) = 512.
	self assert: (helper lastPositionInSameBlockOf: 511) = 512.
	self assert: (helper lastPositionInSameBlockOf: 512) = 512.
	self assert: (helper lastPositionInSameBlockOf: 513) = 1024.
	self assert: (helper lastPositionInSameBlockOf: 514) = 1024.
	self assert: (helper lastPositionInSameBlockOf: 1024) = 1024.
	self assert: (helper lastPositionInSameBlockOf: 1025) = 1536.