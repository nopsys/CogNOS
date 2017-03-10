accessing - status
statusBitSet: index
	^ self status: (self status bitOr: 1 << index)