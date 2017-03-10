as yet unclassified
channel
	channel
		ifNil: [channel := RemoteObjectChannel for: self using: 'FileDirectory on: ' , pathName pathName storeString].
	^ channel