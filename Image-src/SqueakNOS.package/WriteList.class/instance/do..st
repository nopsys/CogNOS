as yet unclassified
do: aBlock
	blocksList do: [ :block | aBlock value: (block at: 1) value: (block at: 2) - 1 value:
		 (writeQueue select: [ :write | (block at: 1) <= (write at: 1) and: [(block at: 2) > (write at: 1)]  ]) ].