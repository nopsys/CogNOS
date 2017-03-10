as yet unclassified
standardChangesStream
	| fd |
	"look for the changes file on the test directory"
	fd := FileDirectory default / 'testdata'.
	^fd readOnlyFileNamed: 'SqueakNOS.changes'.
	