as yet unclassified
testIdentityTranslation
	| memory manager |
	memory := Memory new size: 104857600. "100mb"
	manager := PageManager forMemory: memory.
	16r0 to: 16r6400000 - 1 by: 413 do: [:index | self assert: (manager translate: index) = index; assert: (manager isPresentAndAllowed: index)].