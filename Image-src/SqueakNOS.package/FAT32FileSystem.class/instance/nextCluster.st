private
nextCluster
	| strm |
	strm := StreamOnStream on: stream offset: stream position size: self bytesPerCluster.
	^FAT32Cluster contents: strm.