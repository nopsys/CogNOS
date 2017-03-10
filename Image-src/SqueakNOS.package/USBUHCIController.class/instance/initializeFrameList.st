initialization
initializeFrameList
	frameList := ExternalAddress allocate: 4*1024 aligned: 4*1024.
	1 to: 1024 do: [:i | self clearFrameListAt: i].
	self frameListBaseAddress: frameList asInteger.
	self frameNumber: 0.