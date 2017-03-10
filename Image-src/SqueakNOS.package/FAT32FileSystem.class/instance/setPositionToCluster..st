private
setPositionToCluster: aNumber
	| index offset |
	index := self clusterIndexCorrection: aNumber.
	offset := index * self bytesPerCluster.
	stream position: self clusterBeginLBA + offset.
	