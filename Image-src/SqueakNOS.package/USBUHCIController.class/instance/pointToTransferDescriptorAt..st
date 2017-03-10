accessing - frame list
pointToTransferDescriptorAt: index
	^ self
		frameListValueAt: index
		put: ((self frameListValueAt: index) bitAnd: 2 bitInvert) 