remote file compatibility
open: fileName forWrite: writableFlag
	name := fileName.
	rwmode := writableFlag.
	^ self channel remotePerform: #open:forWrite: with: fileName with: writableFlag
