ports
acknowledge
	| read |
	read := self acknowledgePort.
	self acknowledgePort: (read bitOr: 16r80).
	self acknowledgePort: read