accessing - status
signaledSystemError
	" bit 14 - This bit must be set whenever the device asserts SERR#. Devices
	who will never assert SERR# do not need to implement this bit."

	^ self statusBit: 14