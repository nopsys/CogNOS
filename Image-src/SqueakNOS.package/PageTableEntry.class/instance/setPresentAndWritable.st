accessing
setPresentAndWritable 
	| value |
	value := handle unsignedLongAt: 1.
	value := value bitOr: self presentAndWritableWord.
	handle unsignedLongAt: 1 put: value 	