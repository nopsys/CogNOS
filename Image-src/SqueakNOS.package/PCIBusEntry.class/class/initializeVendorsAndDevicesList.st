initialization
initializeVendorsAndDevicesList
	" self initializeVendorsAndDevicesList "
	^VendorsAndDevices := self parseVendorsAndDevicesFromPCIIDsDatabase: (ReadStream on: self vendorsAndDevicesData).