as yet unclassified
controlledBy: aController device: aDeviceNumber
	loadedDevices ifNil: [ loadedDevices := Dictionary new ].
	(loadedDevices at: aController 
		ifAbsentPut: [ Dictionary new ])
		at: aDeviceNumber
			ifAbsentPut: [self new controller: aController; deviceNumber: aDeviceNumber].
	^(loadedDevices at: aController) at: aDeviceNumber.