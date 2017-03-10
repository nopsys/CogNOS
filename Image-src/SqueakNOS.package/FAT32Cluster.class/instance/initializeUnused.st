initialize-release
initializeUnused
	self allRecords do: [:record | record free]