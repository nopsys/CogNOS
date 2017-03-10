as yet unclassified
objectForHandle: handle
	^ (self channels at: handle ifAbsent: [^ nil]) object