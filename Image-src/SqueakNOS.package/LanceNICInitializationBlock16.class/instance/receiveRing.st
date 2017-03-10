accessing - noauto
receiveRing
	^ LanceNICReceiveRingDescriptor16 fromHandle: (ExternalAddress new fromInteger: (self receiveRingAddress))