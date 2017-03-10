instance creation
master
	^ ((self onPort: 16r20)
		slave: self slave) enableIRQ: 0