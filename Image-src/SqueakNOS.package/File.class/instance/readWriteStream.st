services
readWriteStream
	| stream |
	stream := MultiByteFilesystemFileStream for: self.
	^stream