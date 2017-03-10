as yet unclassified
testFirstPositionInSameBlock

	| helper |
	helper := BlockArithmetic new size: 512.

	self assert: (helper firstPositionInSameBlockOf: 1) = 1.
	self assert: (helper firstPositionInSameBlockOf: 2) = 1.
	self assert: (helper firstPositionInSameBlockOf: 300) = 1.
	self assert: (helper firstPositionInSameBlockOf: 511) = 1.
	self assert: (helper firstPositionInSameBlockOf: 512) = 1.
	self assert: (helper firstPositionInSameBlockOf: 513) = 513.
	self assert: (helper firstPositionInSameBlockOf: 514) = 513.
	self assert: (helper firstPositionInSameBlockOf: 1024) = 513.
	self assert: (helper firstPositionInSameBlockOf: 1025) = 1025.