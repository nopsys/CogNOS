accessing - noauto
macAddress: anEthernetAddress
	| a6BytesInteger |
	a6BytesInteger := anEthernetAddress asInteger.
	self mac0: (a6BytesInteger bitAnd: 16rFFFF).
	self mac1: (a6BytesInteger >> 16 bitAnd: 16rFFFF).
	self mac2: (a6BytesInteger >> 32 bitAnd: 16rFFFF).
