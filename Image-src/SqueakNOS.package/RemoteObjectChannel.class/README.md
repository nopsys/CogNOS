I'm a channel used on the client side of an RPC communication. I know how to perform: something on a remote object and return the answer. Classes must be mirrored on both images

" To start a remoting server, do the next in a standard squeak."
RemoteObjectChannel stream socket closeAndDestroy.
RemoteObjectChannel waitConnectionsOnPort: 1234.
[RemoteObjectChannel performNext] repeat..

" To connect to a remoting server from a standard Squeak (testing) do:"
RemoteObjectChannel conRemoteObjectChannel stream socket closeAndDestroy.
nectSocketTo: NetNameResolver localHostAddress onPort: 1234

" To setup the remoting client inside SqueakNOS, do the next"
Computer current defaultSerialPort open.
RemoteObjectChannel stream: (DeviceStream on: Computer current defaultSerialPort)

" To test do:"
(RemoteMultiByteStream oldFileNamed: 'TestFile.st') fileIn

" If you want to change default File and Directory classes, edit the next methods:"
activeDirectoryClass
	^ RemoteFileDirectory

concreteStream
	^ RemoteMultiByteFileStream
