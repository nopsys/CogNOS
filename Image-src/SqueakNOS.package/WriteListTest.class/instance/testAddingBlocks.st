as yet unclassified
testAddingBlocks

	| list |
	list := WriteList new.
	
	list reserve: 5 at: 10.
	list reserve: 10 at: 50.
	list reserve: 15 at: 18.
	list reserve: 3 at: 15.
	
	self assert: list blocks = (OrderedCollection with: { 10. 18+ 15 } with: { 50. 60 }).