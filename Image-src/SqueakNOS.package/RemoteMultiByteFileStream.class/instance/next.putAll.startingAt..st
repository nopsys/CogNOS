remote file compatibility
next: anInteger putAll: aString startingAt: startIndex
	^ self nextPutAll: (aString copyFrom: startIndex to: startIndex + anInteger)