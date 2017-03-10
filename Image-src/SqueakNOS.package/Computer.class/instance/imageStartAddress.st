image
imageStartAddress
	^(KernelModule fromHandle: (ExternalAddress new fromInteger: info multiboot modsAddress)) start