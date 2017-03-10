accessing - status
receivedTargetAbort
	" bit 12 - This bit must be set by a master device whenever its transaction is
	terminated with Target-Abort. All master devices must implement this
	bit."

	^ self statusBit: 12