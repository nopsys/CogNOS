services
prepareToWriteSnapshot 
	| pageFaultHandler start | 
	computer setSnapshotEndAddress.
	computer memoryManager ifNotNil: [ :manager | 
		pageFaultHandler := PageFaultHandler manager: manager.
		pageFaultHandler handlingBlock: self copyOnWriteHandlingBlock.
		start := computer imageStartAddress.
		manager from: start to: start + 100000000 useHandler: pageFaultHandler.
		computer resetSnapshotInfo
	]