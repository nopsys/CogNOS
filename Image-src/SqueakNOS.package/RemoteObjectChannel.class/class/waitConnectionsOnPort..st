as yet unclassified
waitConnectionsOnPort: port
	| s |
	s := Socket new listenOn: port backlogSize: 10.
	self stream: (SocketStream on: (s waitForAcceptFor: 1000)) binary.