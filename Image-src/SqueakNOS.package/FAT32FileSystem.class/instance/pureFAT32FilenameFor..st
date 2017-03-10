formatting
pureFAT32FilenameFor: aFileName
	FileDirectory splitName: aFileName to: [ :path :name | | basename extension finalName|
		basename := FileDirectory baseNameFor: name. 
		extension := FileDirectory extensionFor: name.
		(basename size > self class basenameMaxSize or: [extension size > self class extensionMaxSize]) ifTrue: [
			basename := (basename first: self class basenameTruncationIndex) , '~1'
		].
		extension := extension copyFrom: 1 to: (extension size min: self class extensionMaxSize).
		finalName := (extension size > 0) ifTrue: [ basename , '.' , extension ] ifFalse: [ basename ].
		^self class join: path to: finalName
	]