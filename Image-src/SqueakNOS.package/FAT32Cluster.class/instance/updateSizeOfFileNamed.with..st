services
updateSizeOfFileNamed: aString with: aNumber
	| index record |
	index := self indexOfRecordNamed: aString.
	record := self recordAt: index.
	record size: aNumber