private
for: aFile
	fileID := aFile.
	name := aFile name.
	self register.
	offset := 0.
	rwmode := true.
	resize := false.
	buffer1 := String new: 1.
	self enableReadBuffering.
	converter := UTF8TextConverter new.
	self detectLineEndConvention.
	