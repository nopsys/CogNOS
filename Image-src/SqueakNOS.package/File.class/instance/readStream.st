services
readStream
	| stream |
	stream := MultiByteFilesystemFileStream for: self.
	stream readOnly.
	^stream