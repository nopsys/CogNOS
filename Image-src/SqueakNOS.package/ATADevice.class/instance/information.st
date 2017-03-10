services
information
	"I retrieve information about this device"
	| info |
	info := controller
		selectDrive: deviceNumber;
		cmdIdentifyDevice;
		readAllAvailable.
	^IDEHardDiskDeviceInformation fromHandle: info asByteArray