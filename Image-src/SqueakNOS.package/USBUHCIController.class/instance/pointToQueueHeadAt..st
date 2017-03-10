accessing - frame list
pointToQueueHeadAt: index
	^ self
		frameListValueAt: index
		put: ((self frameListValueAt: index) bitOr: 2) 