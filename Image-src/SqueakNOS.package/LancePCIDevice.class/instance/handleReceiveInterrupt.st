irq handling
handleReceiveInterrupt
	| ring pkt |
	ring := self initializationBlock receiveRing.
	ring isOwnedByHost ifTrue: [
		pkt := EthernetPacket bytes: ring message.
		ring beOwnedByCard.
		self input: pkt.
	].