accessing - status
hasCapabilitiesList
	" bit 4 - This optional read-only bit indicates whether or not this device
	implements the pointer for a New Capabilities linked list at offset 34h.
	A value of zero indicates that no New Capabilities linked list is
	available. A value of one indicates that the value read at offset 34h is a
	pointer in Configuration Space to a linked list of new capabilities. Refer
	to Section 6.7. of PCI Local Bus Spec for details on New Capabilities."

	^ self statusBit: 4