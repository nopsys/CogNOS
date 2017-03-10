registers
atDataPortRegRead: anAmount
	"Read amount of shorts from data register."
	^ self shortStringAt: 0 size: anAmount.