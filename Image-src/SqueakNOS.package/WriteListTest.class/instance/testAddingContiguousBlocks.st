as yet unclassified
testAddingContiguousBlocks

	| list |
	list := WriteList new.
	
	list reserve: 1 at: 28322905.
	list reserve: 1 at: 28322906.
	list reserve: 64 at: 28322907.
	
	self assert: list blocks = (OrderedCollection with: { 28322905. 28322907 + 64 }).