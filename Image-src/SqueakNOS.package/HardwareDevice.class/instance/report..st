reporting
report: msg
	Transcript
		cr;
		show: self;
		nextPutAll: ': ', msg asString;
		flush.