accessing - status
anyError
	"bit 15 - ERR
	Error is set by the ORing of BABL, CERR, MISS, and MERR.
	ERR remains set as long as any of the error flags are true.
	Read accessible always. ERR is read only. Write operations are
	ignored."

	^ self statusBit: 15