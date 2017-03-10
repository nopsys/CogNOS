accessing
waitData
	| answer |
	2
		timesRepeat: 
			[(answer := self readData) ifNotNil: [^ answer].
			" (Delay forMilliseconds: 1) wait "].
	Transcript cr; show: ' wait data timedout.'.
	^ nil