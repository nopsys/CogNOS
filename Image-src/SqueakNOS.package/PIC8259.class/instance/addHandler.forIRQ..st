dispatching
addHandler: anObject forIRQ: aNumber
	" the master mantains the array of dispatchers"
	| dispatcher |

	dispatcher := self dispatcherForIRQ: aNumber.
	dispatcher ifNil: [
		dispatcher := InterruptRequestDispatcher onIRQ: aNumber.
		self dispatcher: dispatcher forIRQ: aNumber.
		dispatcher
			addHandler: anObject;
			installOn: computer.
	] ifNotNil: [
		dispatcher addHandler: anObject].

	Transcript cr; show:
		'handler for IRQ #',
		aNumber printString,
		' installed: ',
		anObject printString.