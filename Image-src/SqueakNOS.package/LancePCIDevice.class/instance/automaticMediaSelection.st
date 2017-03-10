accessing - bus control
automaticMediaSelection
	^ self miscConfiguration: (self miscConfiguration bitOr: 2r10)