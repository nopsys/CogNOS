system startup
installOn: aComputer 
	| first |
	first := nil.
	self detectedUARTS with: #(4 3 4 3) do: [:uart :irq |
		uart notNil ifTrue: [
			first isNil ifTrue: [first := uart].
			aComputer interruptController
				addHandler: uart
				forIRQ: irq]].
	^ aComputer defaultSerialPort: first.