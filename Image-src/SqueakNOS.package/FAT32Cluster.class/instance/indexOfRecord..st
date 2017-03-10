private
indexOfRecord: id
	self records withIndexDo: [:record :index | (record firstCluster = id) ifTrue: [^index]].
	self error: 'Not found'