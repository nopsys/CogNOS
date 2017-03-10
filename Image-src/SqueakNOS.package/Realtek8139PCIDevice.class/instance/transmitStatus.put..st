transmiting
transmitStatus: index put: value
	^ self longAt: index*4+16r10 put: value