debugging
show: aString 
	Saving ifNotNil: [ 
		self current ifNotNil: [ :c | c primPushDebugString: aString, String lf ]
	]