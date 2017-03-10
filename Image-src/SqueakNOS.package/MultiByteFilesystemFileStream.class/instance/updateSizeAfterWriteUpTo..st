private
updateSizeAfterWriteUpTo: aNumber
	aNumber > fileID size ifTrue: [fileID filesystem updateSizeOf: fileID with: aNumber].