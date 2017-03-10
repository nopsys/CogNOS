dispatching
removeHandler: anObject forIRQ: aNumber
	" the master mantains the array of dispatchers"
	| dispatcher |

	dispatcher := self dispatcherForIRQ: aNumber.
	dispatcher ifNotNil: [dispatcher removeHandler: anObject].

	Transcript cr; show:
		'handler for IRQ #',
		aNumber printString,
		' removed: ',
		anObject printString.