initialize-release
initializeSameAddresses
	| i |
	i := 1.
	self records do: [:record | record address: i]