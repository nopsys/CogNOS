accessing
biggestEmptyBlock
	"Answers the biggest free block of memory"
	^self emptyBlocks detectMax: [ :block | block interval last - block interval first ].