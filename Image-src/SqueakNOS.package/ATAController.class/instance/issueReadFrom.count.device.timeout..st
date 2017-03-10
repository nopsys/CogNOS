services
issueReadFrom: firstSector count: sectorsCount device: deviceNumber timeout: timeout
	^self waitUntilNotBusyOr: timeout;
		 sectorCount: sectorsCount;
		 selectSector: firstSector ofDrive: deviceNumber;
		 waitUntilReadyOr: timeout;
		 cmdReadSectorsWithRetry;
		 readAllAvailable: sectorsCount.
	
