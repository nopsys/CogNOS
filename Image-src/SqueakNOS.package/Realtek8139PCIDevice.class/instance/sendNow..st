transmiting
sendNow: anEthernetPacket
	| oldTxIndex |
	nextTxIndex := (oldTxIndex := nextTxIndex) + 1 \\ 4.	"race condition here if two threads want to do this"
	^ self sendNow: anEthernetPacket on: oldTxIndex.