instance creation
onPort: portNumber 
	^ self basicNew resource: (ExternalIOPort address: portNumber);
		 initialize