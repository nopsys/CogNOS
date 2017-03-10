as yet unclassified
installOn: aComputer
	| serial |
	serial := Computer current defaultSerialPort.
	serial ifNil: [^self].
	serial open.
	self stream: (DeviceStream on: serial).
	[[RemoteObjectChannel performNext] repeat] fork.
