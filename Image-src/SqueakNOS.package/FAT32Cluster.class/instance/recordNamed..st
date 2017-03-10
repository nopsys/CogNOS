services
recordNamed: aString
	| index |
	index := self indexOfRecordNamed: aString.
	^self recordAt: index