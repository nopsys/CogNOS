accessing - status
signaledTargetAbort
	" bit 11 - This bit must be set by a target device whenever it terminates a
	transaction with Target-Abort. Devices that will never signal Target-
	Abort do not need to implement this bit."

	^ self statusBit: 11