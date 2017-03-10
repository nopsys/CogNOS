accessing
lateCollisionError
	"Late Collision indicates that a collision has occurred after the first
	slot time of the channel has elapsed. The PCnet-PCI II con-
	troller does not retry on late collisions. LCOL is set by the
	PCnet-PCI II controller and cleared by the host."
	^ self mcnttdrBit: 12