accessing
on: aStream offset: anOffset size: aSize
	original := aStream.
	stream := aStream copy.
	position := 0.
	offset := anOffset.
	aStream position: anOffset.
	readLimit := aStream size min: aSize.
	self binary