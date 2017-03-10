initialize-release
identityMappingStartingAt: address pageSize: aNumber
	self entries withIndexDo: [:entry :index | entry clean; setPresentAndWritable; pageFrame: (index - 1) * aNumber + address]
	