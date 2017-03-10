instance creation
streamForEndOfDirectory
	| contents |
	contents := ByteArray new: self size withAll: 0.
	^ReadWriteStream with: contents