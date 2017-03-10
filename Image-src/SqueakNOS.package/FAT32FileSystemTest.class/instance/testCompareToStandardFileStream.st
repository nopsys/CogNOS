as yet unclassified
testCompareToStandardFileStream
	| fat32TestStream standardTestStream |
	
	fat32TestStream := self fat32ChangesStream.
	standardTestStream := self standardChangesStream.
	
	self assert: fat32TestStream size = standardTestStream size.
	self assert: ((fat32TestStream next: 1000) = (standardTestStream next: 1000)).
	
	fat32TestStream position: 10000.
	standardTestStream position: 10000.
	
	self assert: ((fat32TestStream basicUpTo: $!) = (standardTestStream basicUpTo: $!)).
	
	fat32TestStream position: fat32TestStream size - 500.
	standardTestStream position: standardTestStream size - 500.
	
	self assert: ((fat32TestStream upToEnd) = standardTestStream upToEnd).
	