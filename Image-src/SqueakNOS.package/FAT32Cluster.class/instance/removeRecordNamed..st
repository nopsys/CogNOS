services
removeRecordNamed: aString
	| record |
	record := self recordNamed: aString.
	record free
	