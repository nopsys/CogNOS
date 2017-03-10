paging
enablePaging
	| pagingEnabled |
	pagingEnabled := self cr0 bitAt: 32 put: 1. "Enable paging"
	pagingEnabled := pagingEnabled bitAt: 17 put: 1. "Enable write protect"
	self cr0: pagingEnabled