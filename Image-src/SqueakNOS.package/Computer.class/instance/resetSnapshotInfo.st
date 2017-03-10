initialize-release
resetSnapshotInfo
	self totalPageFaults: 0.
	info	 snapshotInfo saved: 0; toSave: 500; resetPages
	