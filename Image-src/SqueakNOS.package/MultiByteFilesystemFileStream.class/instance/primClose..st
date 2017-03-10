private
primClose: id
	resize ifFalse: [^true].
	id filesystem cleanExtraSpace: id; flush.
	^true