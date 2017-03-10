private
firstAddress
	^ ExternalAddress new fromInteger: (self queueElementLinkPointerRQT bitClear: 2r1111) 