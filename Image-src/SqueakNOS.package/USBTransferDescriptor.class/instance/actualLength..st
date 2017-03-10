accessing - status etc.
actualLength: anInteger
	^ self statusActLen: (self statusActLen bitAnd: 16rFFFFFC00) + (anInteger - 1)