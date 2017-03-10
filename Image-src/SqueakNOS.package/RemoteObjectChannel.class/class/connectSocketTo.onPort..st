as yet unclassified
connectSocketTo: ipAddress onPort: port
	self stream: (SocketStream openConnectionToHost: ipAddress port: port) binary.
