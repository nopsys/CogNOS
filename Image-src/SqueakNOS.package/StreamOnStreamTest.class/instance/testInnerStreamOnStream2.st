as yet unclassified
testInnerStreamOnStream2
	| changes size str1 str2 data contents |
	changes := StandardFileStream fileNamed: 'testdata/test.changes'.
	size := changes size.
	changes position: size - 10.
	data := (changes next: 10) asString.
	str1 := StreamOnStream
				on: changes
				offset: changes size - 100
				size: 100.
	str2 := StreamOnStream
				on: changes copy
				offset: changes size - 100
				size: 100.
	[str1 position: 90;
		 nextPutAll: 'testtestst'.
	str2 position: 0; nextPutAll: 'test'. 
	"self assert: (str2 next: 10) = 'testtestst'."
	changes flush; close; open: changes name forWrite: true.
	self assert: changes size = size.
	contents := changes contents asString.
	self assert: (contents last: 10) asString = 'testtestst'; assert: ((contents last: 100)first: 4) = 'test']
		ensure: [changes position: size - 10;
				 nextPutAll: data]