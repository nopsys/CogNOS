accessing - basic
macAddress
	| answer |
	answer := self controlStatusWord: 14.
	answer := answer << 16 + (self controlStatusWord: 13).
	answer := answer << 16 + (self controlStatusWord: 12).
	^ EthernetAddress fromInteger: answer