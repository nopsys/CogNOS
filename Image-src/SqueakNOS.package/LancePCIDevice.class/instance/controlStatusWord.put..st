accessing - control status
controlStatusWord: index put: word
	^ self
		address: index;
		controlStatusData: word.