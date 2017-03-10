handling
handleOn: aComputer 
"	Transcript cr; show: 'handling IRQ #', interruptNumber asString.
"	clients
		do: [:each |
			[each handleIRQfor: self on: aComputer]
				ifError: [:err :rcvr | 
					Transcript
						nextPutAll: err;
					 	nextPutAll: ' when handling IRQ #';
						print: interruptNumber;
						nextPutAll: ' on ';
						print: each;
						cr;
						flush.
				]
	].
"	Transcript cr; show: ' handled'.
"