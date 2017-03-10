private
primTruncate: id to: aSize
	"Truncate this file to the given position."
	fileID filesystem updateSizeOf: fileID with: aSize