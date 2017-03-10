printing
printOn: strm
	strm
		nextPutAll: self class name;
		nextPut: $:;
		space;
		nextPutAll: bus printStringHex;
		nextPut: $:;
		nextPutAll: device printStringHex;
		nextPut: $.;
		nextPutAll: function printString;
		space;
		nextPutAll: self stringForVendorAndDevice.