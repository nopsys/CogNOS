private
externalAddressFor: anIndex
	^self externalAddress + (self entrySize * anIndex)