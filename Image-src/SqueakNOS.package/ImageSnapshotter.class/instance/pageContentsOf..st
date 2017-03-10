services
pageContentsOf: anAddress
	| start |
	start := computer memoryManager pageStartAddressOf: anAddress.
	^(Buffer at: start size: computer memoryManager pageSize) contents