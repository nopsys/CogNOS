as yet unclassified
installOn: aComputer
	| pciEntry |
	pciEntry := PCIBusEntry allValid
		detect: [:e |
			e classCode == self classCode and: [
			e classSubCode == self classSubCode and: [
			e programmingInterface == self programmingInterface]]]
		ifNone: [^ self].

	^ self onPCIEntry: pciEntry computer: aComputer.
