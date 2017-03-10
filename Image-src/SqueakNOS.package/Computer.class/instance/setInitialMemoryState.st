initialize-release
setInitialMemoryState
	| image multiboot map |
	multiboot := info multiboot.
	multiboot areModulesValid ifTrue: [image := KernelModule fromHandle: (ExternalAddress new fromInteger: multiboot modsAddress)].
	multiboot areMemoryAddressesValid ifTrue: [self memory size: info multiboot memUpper + 1024 * 1024].
	"multiboot isMemoryMapValid ifTrue: [
		map := MultiBootMemoryMap fromHandle: (ExternalAddress new fromInteger: multiboot mmapAddress) size: multiboot mmapLength.
		map do: [:entry | | base | entry type = 1 ifFalse: [base := entry baseAddress. self memory alreadyReserved: (base to: base + entry length) for: 'Reserved']]
	]".
	self memory 
		alreadyReserved: (0 to: 1048575) for: 'First mega of low memory for bios, drivers, etc.';
		alreadyReserved: (1048576 to: self primEndOfVM) for: 'Virtual Machine code and data structures';
		alreadyReserved: (image start to: image end) for: 'Object memory (image)'.
	
		
	