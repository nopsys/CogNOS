image
imageEndAddress
	^(KernelModule fromHandle: (ExternalAddress new fromInteger: info multiboot modsAddress)) end