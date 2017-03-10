initialize-release
installCallbackOn: aComputer
	| callback |
	pageFaultCallback := Callback block: [:args :result | "Project spawnNewProcessIfThisIsUICallback: Processor activeProcess"
													    pageHandled wait. 
													    result returnInteger: 1]
								    argsClass: PageFaultParameters.
	aComputer info pageFaultHandlerEntry: pageFaultCallback thunk address.
	Computer primRegisterSemaphoreIndex: (Smalltalk registerExternalObject: interrupted) forIRQ: 15. 
	[[true] whileTrue: [
		interrupted wait. "this is activated by C glue code"
		self resolvePageFaultOn: aComputer pageFaultAddress.
		pageHandled signal]
	] forkAt: Processor highIOPriority + 1