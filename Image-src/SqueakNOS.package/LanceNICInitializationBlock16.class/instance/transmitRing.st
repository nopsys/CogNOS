accessing - noauto
transmitRing
	^ LanceNICTransmitRingDescriptor16 fromHandle: (ExternalAddress new fromInteger: (self transmitRingAddress))