accessing - frame list
isTerminatorAt: index
	^ (self frameListValueAt: index) anyMask: 1