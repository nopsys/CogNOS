accessing - frame list
frameListAddressAt: index
	^ ExternalAddress fromInteger: ((self frameListValueAt: index) bitClear: 2r1111)