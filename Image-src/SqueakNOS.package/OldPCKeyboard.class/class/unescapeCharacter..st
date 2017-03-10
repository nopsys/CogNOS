system startup
unescapeCharacter: char 
	char = $t ifTrue: [^ Character tab].
	char = $r ifTrue: [^ Character cr].
	char = $n ifTrue: [^ Character lf].
	^ char