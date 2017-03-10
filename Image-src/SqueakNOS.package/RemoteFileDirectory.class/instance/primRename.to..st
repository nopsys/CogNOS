as yet unclassified
primRename: oldFileFullName to: newFileFullName 
	^ self channel remotePerform: #primRename:to: with: oldFileFullName with: newFileFullName.
