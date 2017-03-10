private
primRead: id into: byteArray startingAt: startIndex count: count
	"Read up to count bytes of data from this file into the given string or byte array starting at the given index. Answer the number of bytes actually read."
	| contents endIndex |
	contents := id filesystem
				contentsFor: id
				startingAt: offset
				count: (count min: (self size - offset)).
	endIndex := startIndex + (count min: contents size) - 1.			
	byteArray replaceFrom: startIndex to: endIndex with: contents.		
	self primSetPosition: id to: (self primGetPosition: id) + contents size.				
	^contents size