transmiting
sendNow: anEthernetPacket on: descriptorIndex
	| str |
	str := anEthernetPacket asString padded: #right to: 60 with: $ .
	(self transmitStartAddress: descriptorIndex) stringAt: 1 put: str.
	self transmitStatus: descriptorIndex put: str size.