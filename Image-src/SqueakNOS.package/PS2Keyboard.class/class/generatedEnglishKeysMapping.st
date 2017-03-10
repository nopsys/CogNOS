class initialization
generatedEnglishKeysMapping

	| mapping temp |
	
	mapping := Dictionary new.
	
	mapping at: #(none) put: (self cCharsToArray: '\0331234567890-=\010\t' ,
		'qwertyuiop[]\r\000as' ,
		'dfghjkl;''`\000\\zxcv' ,
		'bnm,./\000*\000 \000\201\202\203\204\205' ,
		'\206\207\210\211\212\000\000789-456+1' ,
		'230\177\000\000\213\214\000\000\000\000\000\000\000\000\000\000' ,
		'\r\000/').
		
	mapping at: #(shift) put: (self cCharsToArray: 
		'\033!@#$%^&*()_+\010\t' ,
		'QWERTYUIOP{}\r\000AS' ,
		'DFGHJKL:"~\000|ZXCV' ,
		'BNM<>?\000*\000 \000\201\202\203\204\205' ,
		'\206\207\210\211\212\000\000789-456+1' ,
		'230\177\000\000\213\214\000\000\000\000\000\000\000\000\000\000' ,
		'\r\000/').
		
	mapping at: #(alt) put: (Array new: 128 withAll: (Character value: 0)).
	mapping at: #(shift alt) put: (Array new: 128 withAll: (Character value: 0)).
	
	temp := Array new: 128 withAll: (Character value: 0).
	temp at: 16r48 put: Character arrowUp.
	temp at: 16r50 put: Character arrowDown.
	temp at: 16r4D put: Character arrowRight.
	temp at: 16r4B put: Character arrowLeft.
	temp at: 16r47 put: Character home.
	temp at: 16r4F put: Character end.
	temp at: 16r49 put: Character pageUp.
	temp at: 16r51 put: Character pageDown.
	temp at: 16r52 put: Character insert.	
	temp at: 16r53 put: Character delete.

	mapping at: #(extended) put: temp.
	
	 ^mapping.