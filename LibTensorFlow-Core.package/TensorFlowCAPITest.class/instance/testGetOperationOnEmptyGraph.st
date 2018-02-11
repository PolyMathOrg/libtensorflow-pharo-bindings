testing operation
testGetOperationOnEmptyGraph
	| graph |
	graph := self emptyGraph.
	
	self
		should: [graph operationNamed: 'something']
		raiseError: 'Operation not found'.