accessing - frame list
isPointingToQueueHeadAt: index
	^ (self frameListValueAt: index) anyMask: 2