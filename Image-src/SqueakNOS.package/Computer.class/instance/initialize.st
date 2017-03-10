initialize-release
initialize
	self currentWorld flash; fullRepaintNeeded.
	processor := X86Processor new.
	devices := Dictionary new.
	self class tweakSqueakForSqueakNOS.
	PIC8259 installOn: self.
	PCIBusEntry allValid do: [:bus | Transcript show: bus; cr; cr].
	"OldPCKeyboard installOn: Current. "
	PS2Keyboard installOn: self.
	self defaultNetworkInterface: nil.
	self initializeBridge.
	Memory installOn: self.
	self enablePaging.
	UART16550 installOn: self.
	CMOS installOn: self.
"	RemoteObjectChannel installOn: self.
	LancePCIDevice installOn: self.
	Realtek8139PCIDevice installOn: self.
	self defaultNetworkInterface ifNotNil: [
		self networkingStack: (EthernetInterface on: self defaultNetworkInterface)].
	USBUHCIController installOn: self.
	SDDevice installOn: self."
	Display forceToScreen.
	(self confirm: 'Do you want to load sources from disk?') ifTrue: [self openSourceFiles]