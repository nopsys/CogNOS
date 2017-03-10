as yet unclassified
testRoot
	| filesystem root |
	filesystem := self newInstance.
	root := filesystem root.
	self assert: root directories size = 2.