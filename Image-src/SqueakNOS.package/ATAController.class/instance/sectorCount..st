registers
sectorCount: aSmallInteger
	"We handle special case when we want to read 256 sectors, which is done by puting a 0 in
	 sector count register"
	aSmallInteger = 256 ifTrue: [^ self byteAt: 2 put: 0].
	^ self byteAt: 2 put: aSmallInteger