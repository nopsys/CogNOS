accessing
resetDevice: aDriveNumber
	^self
		selectDrive: aDriveNumber;
		cmdDeviceReset