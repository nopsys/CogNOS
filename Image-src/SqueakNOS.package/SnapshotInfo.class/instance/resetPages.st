initialize-release
resetPages
	| address |
	address := ExternalAddress allocate: self toSave * ReadonlyPage byteSize.
	self pages: address 