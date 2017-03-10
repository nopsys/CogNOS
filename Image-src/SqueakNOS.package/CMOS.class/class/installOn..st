as yet unclassified
installOn: aComputer 
	^ aComputer
		cmos: ((self onPort: 112)
				computer: aComputer)