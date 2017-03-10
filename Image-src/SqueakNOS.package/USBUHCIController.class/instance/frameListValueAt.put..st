accessing - frame list
frameListValueAt: index put: anInteger
	frameList unsignedLongAt: index * 4 - 3 put: anInteger