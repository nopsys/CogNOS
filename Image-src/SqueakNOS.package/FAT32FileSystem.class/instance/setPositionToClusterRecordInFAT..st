private
setPositionToClusterRecordInFAT: aNumber
	stream position: self fatBeginLBA + (aNumber * self fatRecordSize).
	