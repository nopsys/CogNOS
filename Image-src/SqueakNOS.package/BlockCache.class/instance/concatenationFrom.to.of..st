as yet unclassified
concatenationFrom: first to: last of: aCollectionOfChunks
	| result offsetInResult chunkFirst helper i |
	helper := BlockArithmetic new blockSize: self chunkSize.
	i := 1.
	result := ByteArray new: last - first + 1 * self blockSize.
	offsetInResult := 1.
	chunkFirst := first - 1 * self blockSize + 1.

	helper alignedFrom: first to: last do: [ :nextStart :nextEnd | | count |

		count := nextEnd - nextStart + 1 * self blockSize.
		result replaceFrom: offsetInResult to: offsetInResult + count - 1 with: (aCollectionOfChunks at: i) startingAt: chunkFirst.
		chunkFirst := 1.
		i := i + 1.
		offsetInResult := offsetInResult + count.
	].

	^result
