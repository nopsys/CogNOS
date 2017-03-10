as yet unclassified
testWriteSector
	| device newBytes originalBytes |
	"(self confirm: 'This test is going to permanently write into secondary master partition, are you sure you want to continue?')
		ifFalse: [^self]."
	device           := ATAController secondary master.
	originalBytes := device at: 100.
	newBytes      := ByteArray new: 512.
	
	self fill: newBytes.

	[
		device at: 100 writeArray: newBytes.
		self assert: (device at: 100) = newBytes asString
	] ensure: [ "Try to restore the original contents"
		device at: 100 writeArray: originalBytes
	]