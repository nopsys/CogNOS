accessing
contents
	| result |
	result := ByteArray new: self entriesCount * self entrySize.
	self handle copyInto: result from: 1 to: result size in: self handle startingAt: 1.
	^result