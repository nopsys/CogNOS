instance creation
atMemoryAddress: anInteger 
	^ self basicNew resource: (ExternalAddress new fromInteger: anInteger);
		 initialize