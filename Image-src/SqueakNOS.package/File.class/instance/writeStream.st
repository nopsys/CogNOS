services
writeStream
	| stream |
	stream := MultiByteFilesystemFileStream for: self.
	stream writeOnly.
	^stream