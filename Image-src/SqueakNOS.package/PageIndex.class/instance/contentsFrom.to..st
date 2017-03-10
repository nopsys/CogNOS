accessing
contentsFrom: start to: stop
	| result |
	result := ByteArray new: stop - start + 1.
	self handle copyInto: result from: 1 to: result size in: self handle startingAt: start.
	^result