alarm
uninstallAlarm
	self computer interruptController removeHandler: self forIRQ: 8.
	self disableAlarm.