as yet unclassified
input: pkt
	"a packet coming from media"
	self triggerEvent: #input: with: pkt.
