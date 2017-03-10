as yet unclassified
testInnerStreamOnStream
	| changes size str1 str2 |
	changes := StandardFileStream fileNamed: 'testdata/test.changes'.
	size := changes size.	
	str1 := StreamOnStream on: changes offset: changes size - 100 size: 100.
	str1 setToEnd; nextPutAll: 'test'.
	str2 := StreamOnStream on: str1 offset: str1 size - 10 size: 10.
	str2 setToEnd; nextPutAll: 'test'.
	str2 := StreamOnStream on: str1 offset: str1 size - 10 size: 10.
	str2 position: 2; nextPutAll: 'aaaaaaaa'.
	changes flush; close; open: changes name forWrite: true.
	self assert: changes size = (size + 8 ).
	self assert: (changes contents asString last: 8) = 'aaaaaaaa'.
	