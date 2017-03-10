private
clusterBeginLBA
	^self fatBeginLBA + (self numberOfCopiesOfFAT * self bytesPerFAT)