instance creation
installOn: aComputer
	| pciEntry |
	pciEntry := PCIBusEntry allValid
		detect: [:e | e vendorId = self vendorId and: [e deviceId = self deviceId]]
		ifNone: [^ nil].
	^ self onPCIEntry: pciEntry computer: aComputer.
