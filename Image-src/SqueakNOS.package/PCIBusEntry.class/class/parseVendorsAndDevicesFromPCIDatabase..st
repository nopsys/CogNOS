initialization
parseVendorsAndDevicesFromPCIDatabase: strm
	" The csv file was downloaded from http://www.pcidatabase.com/reports.php?type=csv "
	| line fields vendors vendor device |
	vendors := Dictionary new.
	[line := strm upTo: Character lf.
	line notNil and: [line size > 0]] whileTrue: [
		fields := (line findBetweenSubStrs: #('","')) asArray.
		fields size >= 2
			ifTrue: [
				vendor := self numberFromString: (fields at: 1).
				device := self numberFromString: (fields at: 2).
				vendors at: (vendor << 32 + device) put: fields.
				vendors at: vendor put: (fields at: 3)]
			ifFalse: [Transcript show: line; cr].
	].

	^ vendors