accessing
emptyBlocks
	"Calculate all the free memory blocks. The algorithm assumes that used blocks are ordered and not overlapping."
	| emptyBlocks nextBlockStart |
	emptyBlocks := OrderedCollection new.
	nextBlockStart := 0.
	blocks do: [:block |
		block start > nextBlockStart 
			ifTrue: [
				emptyBlocks add: (MemoryBlock from: nextBlockStart to: block start - 1 description: 'Empty')
			].
		nextBlockStart := block end + 1.
	].
	nextBlockStart < size ifTrue: [emptyBlocks add: (MemoryBlock from: nextBlockStart to: size - 1 description: 'Empty') ].
	 ^emptyBlocks.
	