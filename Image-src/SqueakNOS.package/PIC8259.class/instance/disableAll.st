commands
disableAll
	0 to: 7 do: [:i | self disableIRQ: i].
	slave ifNotNil: [slave disableAll]