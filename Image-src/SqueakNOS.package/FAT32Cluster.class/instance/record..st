services
record: id
	| index |
	index := self indexOfRecord: id.
	^self recordAt: index