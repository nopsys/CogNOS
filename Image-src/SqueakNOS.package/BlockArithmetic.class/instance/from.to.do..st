accessing
from: first to: last do: aBlock
	first to: last by: blockSize do: [ :next | aBlock value: next ].