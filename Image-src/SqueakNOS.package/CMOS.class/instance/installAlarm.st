alarm
installAlarm
	self computer interruptController addHandler: self forIRQ: 8.
	self enableAlarm.