as yet unclassified
testDeepDirectory
	| filesystem directory |
	filesystem := self newInstance.
	directory := filesystem directoryNamed: '/dira'.
	self assert: directory directories size = 0;
		 assert: (directory fileExists: 'file.txt')
		