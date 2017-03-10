primitives
primRead: id into: byteArray startingAt: startIndex count: count
	"The main problem with this primitive is that it replaces the contents of the string,
	and that is not reflected in the answer. We'll need to hack something if needed"
	self shouldNotImplement.