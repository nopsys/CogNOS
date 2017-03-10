squeakNOS primitives
primReadPort: portNumber into: byteArray startingAt: startIndex count: count
	| index |
	index := startIndex.
	count timesRepeat: [
		byteArray at: index put: self nextByte.
		index := index + 1].