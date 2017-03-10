initialize-release
initializeBridge
	info := VMBridge fromHandle: (ExternalAddress new fromInteger: self primVMBiosInformationPosition)
	