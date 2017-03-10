as yet unclassified
testDirectoryCloning
	| memory manager alienAddresses clone newAddresses |
	[
	memory := Memory new size: 10485760. "10mb" 
	manager := PageManager forMemory: memory.
	alienAddresses := manager directory entries collect: [:entry | entry pointedAddress].
	alienAddresses add: manager directory externalAddress. 
	clone := manager directory deepCopy.
	manager directory: clone.
	newAddresses := manager directory entries collect: [:entry | entry pointedAddress].
	self deny: (alienAddresses includes: manager directory externalAddress);
		 assert: (newAddresses noneSatisfy: [:address | alienAddresses includes: address]).
	16r0 to: 16rA00000 - 1 by: 1000 do: [:index | self assert: (manager translate: index) = index; assert: (manager isPresentAndAllowed: index)].
	] ensure: ["clone free"] 
	