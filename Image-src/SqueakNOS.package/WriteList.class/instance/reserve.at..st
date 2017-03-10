as yet unclassified
reserve: size at: startPosition

	| endPosition |
	endPosition := startPosition + size.

	self removeAllNecesaryFrom: startPosition to: endPosition ifAdd: [ :index :newStartPosition :newEndPosition |
		blocksList add: {newStartPosition. newEndPosition} beforeIndex: index.
	].
	