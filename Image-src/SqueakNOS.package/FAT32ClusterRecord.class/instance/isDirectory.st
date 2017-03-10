testing
isDirectory
	^(self attrib bitAnd: 16) = 16
	