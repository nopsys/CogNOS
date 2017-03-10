accessing
pages
	"This method was automatically generated"
	| pages start |
	pages := OrderedCollection new: self toSave.
	start :=  handle pointerAt: 9.
	0 to: self toSave - 1 do: [:index | pages add: (ReadonlyPage fromHandle: start + (index * ReadonlyPage byteSize))].
	^pages