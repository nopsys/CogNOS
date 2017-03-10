controller commands
setInitialMode: auxPortPresent
	#(keyboardGenerateIRQ1 auxGenerateIRQ12 systemFlag disableKeboardInterface disableMouseInterface  scanCodeConversionToPCFormat ).
	#(1 2 4 16 32 64 ).
	self disableScanning.
	self setMode: (auxPortPresent ifTrue: [16r47] ifFalse: [16r65]).
	self enableScanning

