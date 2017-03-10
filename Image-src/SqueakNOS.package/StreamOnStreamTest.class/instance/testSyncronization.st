as yet unclassified
testSyncronization
	| changes size str1 str2 data contents |
	changes := StandardFileStream fileNamed: 'testdata/test.changes'.
	size := changes size.
	changes position: size - 10.
	data := (changes next: 10) asString.
	str1 := StreamOnStream
				on: changes
				offset: changes size - 100
				size: 100.
	[
		str1 position: 90;  nextPutAll: 'testtestst'; flush; close.
		contents := changes position: size - 10; next: 10.
		self assert: contents asString = 'testtestst'
	] ensure: [
		changes position: size - 10; nextPutAll: data; flush; close.
	]