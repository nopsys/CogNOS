private
primWrite: id from: stringOrByteArray startingAt: startIndex count: count
	"Write count bytes onto this file from the given string or byte array starting at the given index. Answer the number of bytes written."
	| bytesWritten pos |
	pos := self primGetPosition: id.
	bytesWritten := id filesystem
		writeOn: id
		startingAt: pos
		contents: stringOrByteArray
		startingAt: 1
		count: count.
	self updateSizeAfterWriteUpTo: pos + bytesWritten.	
	self primSetPosition: id to: pos + bytesWritten.
	^bytesWritten	
		
	