accessing
macAddress
	| answer |
	answer := self shortAt: 4.
	answer := answer << 32 + (self longAt: 0).
	^ EthernetAddress fromInteger: answer
