private
handlerFor: anAddress
	| interval intervals |
	handlers keys isEmpty ifTrue: [^self defaultPageFaultHandler].  
	intervals := handlers keys select: [:int | int includes: anAddress].
	interval := intervals isEmpty 
	ifTrue: [Computer current primPushDebugString: 'No hay intervalo de handling para la direccion ', anAddress printString. Computer current primPushDebugString: handlers printString. 0] 
	ifFalse: [intervals min].
	^handlers at: interval
	
	
	
