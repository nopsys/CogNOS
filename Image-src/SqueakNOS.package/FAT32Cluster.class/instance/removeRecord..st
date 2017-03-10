services
removeRecord: id
	| record |
	record := self record: id.
	record free
	