services
from: startAddress to: stopAddress useHandler: aPageFaultHandler
	handlers at: (startAddress to: stopAddress) put: aPageFaultHandler