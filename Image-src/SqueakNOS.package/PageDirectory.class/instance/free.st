memory management
free
	self halt.
	self entries do: [:entry | entry free].
	super free.