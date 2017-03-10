memory
enablePaging
	memoryManager := PageManager forMemory: self memory using: processor.
	memoryManager installOn: self.
	