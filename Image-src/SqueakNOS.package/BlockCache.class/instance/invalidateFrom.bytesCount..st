as yet unclassified
invalidateFrom: destOffset bytesCount: bytesCount
	| helper |
	helper := BlockArithmetic new size: self chunkSize * self blockSize.
	helper from: (helper blockNumberOf: destOffset) to: (helper blockNumberOf: destOffset + bytesCount - 1) do: [ :chunkStart |
		chunks removeKey: chunkStart ifAbsent: [].
	].