private
pageTables: anOrderedCollection
	(self entries first: anOrderedCollection size) withIndexDo: [:entry : index | entry pageFrame: (anOrderedCollection at: index) externalAddress; setPresentAndWritable]