accessing - noauto
macAddress
	| addr |
	addr := self mac2 << 16 + self mac1 << 16 + self mac0.
	^ EthernetAddress fromInteger: addr