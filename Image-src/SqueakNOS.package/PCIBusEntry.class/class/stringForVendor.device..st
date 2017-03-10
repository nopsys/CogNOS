initialization
stringForVendor: vendorId device: deviceId
	| vendor device |
	vendor := VendorsAndDevices
		at: vendorId
		ifAbsent: ['unknown ', vendorId hex].
	device := VendorsAndDevices
		at: vendorId << 32 + deviceId
		ifAbsent: ['unknown ', deviceId hex].
	^ 'Vendor: ', vendor, ' Device: ', device
