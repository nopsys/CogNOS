accessing - frame list
isPointingToTransferDescriptorAt: index
	^ ((self frameListValueAt: index) anyMask: 2) not