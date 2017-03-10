methodsFor:
on: aStream offset: anOffset
	^self on: aStream offset: anOffset size: aStream size - anOffset.