squeakNOS primitives
primWritePort: portNumber from: byteArray startingAt: startIndex count: count
	| index |
	index := startIndex.
	count timesRepeat: [self nextPut: (byteArray at: index)]