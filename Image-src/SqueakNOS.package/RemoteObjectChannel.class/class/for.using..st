as yet unclassified
for: anObject using: contructorString
	| handle |
	handle := (self channels at: 0)
		remotePerform: #newOnServerFor:
		withString: '{',contructorString,'}'.

	^ self new
		handle: handle;
		stream: self stream;
		object: anObject
