accessing
add: aHardwareDevice named: aSymbol
	Transcript cr; show: aHardwareDevice printString, ' installed as ', aSymbol.
	^ devices at: aSymbol put: aHardwareDevice