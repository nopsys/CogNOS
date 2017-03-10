as yet unclassified
newOnServerFor: anObject
	| handle |
	handle := self newHandle.
	self channels at: handle put: (
		self new
			handle: handle;
			object: anObject).	" no need to set the stream on the server side "
	^ handle