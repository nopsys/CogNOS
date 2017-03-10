services
at: aTitle benchmark: aBlock size: aSize
	| runTime bytesPerSecond stream |
	runTime := Time millisecondsToRun: aBlock.
	bytesPerSecond := aSize / runTime * 1000.
	stream := WriteStream on: ''.
	stream nextPutAll: runTime asString; nextPutAll: ' ms. Throughput: '.
	(bytesPerSecond / (1024*1024)) asFloat absPrintOn: stream base: 10 digitCount: 5.
	stream nextPutAll: ' MB/s'.
	results at: aTitle put: stream contents.
	
