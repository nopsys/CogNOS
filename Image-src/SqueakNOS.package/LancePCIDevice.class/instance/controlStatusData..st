accessing - control status
controlStatusData: word
	^ self shortAt: 16r10 put: word