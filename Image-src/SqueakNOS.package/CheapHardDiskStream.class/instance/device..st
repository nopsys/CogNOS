accessing
device: device
	fileID := device.
	buffer1 := String new: 1.
	name := device printString.
	position := 0.
	offset := 0.
	fileSize := 199493210.
	rwmode := true.
	self enableReadBuffering