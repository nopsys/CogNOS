services
readWriteFrom: start to: end
	(self pageTableEntriesFor: (start to: end)) do: [:entry | entry readWrite]