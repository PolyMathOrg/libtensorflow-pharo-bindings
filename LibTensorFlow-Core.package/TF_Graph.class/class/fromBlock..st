instance creation
fromBlock: aBlockClosure
	| output graph |
	graph := self create.
	output := graph fromBlock: aBlockClosure.
	output alias: 'output'.
	^ graph