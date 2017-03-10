instance creation
streamForNewRecord
	| contents |
	contents := ByteArray new: self size withAll: 0.
	^ReadWriteStream with: contents.
	