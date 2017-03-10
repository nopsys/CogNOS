irq handling
handleReceiveInterrupt
	| rbuf status len |
	[self hasReceiveBufferEmpty] whileFalse: [
		rbuf := self receiveReadAddress.
		status := rbuf unsignedShortAt: 1.
		len := rbuf unsignedShortAt: 3.
		(status anyMask: 1) ifTrue: [	"received OK"
			self input: 
				(EthernetPacket bytes: (rbuf stringAt: 5 size: len - 4))].	"The length includes Ethernet CRC"

		"+4 for PacketHeader, wrap around and align to 4"
		len := self receiveReadOffset + len + 4 + 3 bitAnd: 16rFFFC.
		self receiveReadOffset: len.]
